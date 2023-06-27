<?php

$result = array();
$result['success'] = false;
$result['error_message'] = Registry::load('strings')->went_wrong;
$result['error_key'] = 'something_went_wrong';

$no_error = false;
$message_id = 0;
$current_user_id = Registry::load('current_user')->id;
$group_ids = array();
$load_group_id = 0;

$super_privileges = false;

if (role(['permissions' => ['groups' => 'super_privileges']])) {
    $super_privileges = true;
}


if (isset($data['group_id'])) {
    if (!is_array($data['group_id'])) {
        $data["group_id"] = filter_var($data["group_id"], FILTER_SANITIZE_NUMBER_INT);
        $group_ids[] = $data["group_id"];
    } else {
        $group_ids = array_filter($data["group_id"], 'ctype_digit');
    }
}

if (isset($data['message_id'])) {
    $message_id = filter_var($data["message_id"], FILTER_SANITIZE_NUMBER_INT);
}


if (!empty($group_ids) && !empty($message_id)) {
    $columns = $join = $where = null;
    $columns = [
        'group_messages.filtered_message', 'group_messages.original_message', 'group_messages.link_preview',
        'group_members.group_role_id', 'group_members.group_member_id', 'group_roles.group_role_attribute',
        'group_messages.group_message_id', 'group_messages.attachment_type', 'group_messages.attachments',
    ];

    $join["[>]group_members"] = ["group_messages.group_id" => "group_id", "AND" => ["group_members.user_id" => $current_user_id]];
    $join["[>]groups"] = ["group_messages.group_id" => "group_id"];
    $join["[>]group_roles"] = ["group_members.group_role_id" => "group_role_id"];

    if (!$super_privileges) {
        $where["group_members.group_role_id[!]"] = null;
        $where["group_roles.group_role_attribute[!]"] = 'banned_users';
    }

    $where["groups.suspended"] = 0;

    $where["group_messages.group_message_id"] = $message_id;
    $where["group_messages.system_message"] = 0;
    $where["LIMIT"] = 1;

    $group_message = DB::connect()->select('group_messages', $join, $columns, $where);

    if (isset($group_message[0])) {
        $group_message = $group_message[0];
        $no_error = true;
    }

    if ($no_error && !empty($group_ids)) {

        $daily_send_limit = role(['find' => 'daily_send_limit_group_messages']);

        if (!empty($daily_send_limit)) {
            $daily_send_limit = filter_var($daily_send_limit, FILTER_SANITIZE_NUMBER_INT);
        }
        if (!empty($daily_send_limit)) {

            $total_chat_messages = DB::connect()->count('group_messages', ['created_on'], [
                'user_id' => Registry::load('current_user')->id,
                'system_message[!]' => 1,
                "created_on[~]" => date('Y-m-d')
            ]);


            if (!empty($total_chat_messages) && (int)$total_chat_messages >= (int)$daily_send_limit) {
                $no_error = false;
                $result = array();
                $result['success'] = false;
                $result['error_message'] = Registry::load('strings')->maximum_sending_rate_exceeded;
                $result['error_key'] = 'maximum_sending_rate_exceeded';
            }
        }
    }

    if ($no_error && !empty($group_ids)) {

        $columns = $join = $where = null;
        $columns = [
            'groups.who_all_can_send_messages', 'group_members.group_role_id',
            'group_members.group_member_id', 'group_roles.group_role_attribute',
            'groups.group_id'
        ];

        $join["[>]group_members"] = ["groups.group_id" => "group_id", "AND" => ["group_members.user_id" => $current_user_id]];
        $join["[>]group_roles"] = ["group_members.group_role_id" => "group_role_id"];

        $where["group_members.group_role_id[!]"] = null;
        $where["group_roles.group_role_attribute[!]"] = 'banned_users';
        $where["groups.suspended"] = 0;

        $where["groups.group_id"] = $group_ids;

        $groups = DB::connect()->select('groups', $join, $columns, $where);

        foreach ($groups as $group) {

            $send_message = false;

            if ($super_privileges || !empty($group['who_all_can_send_messages'])) {
                if ($super_privileges || $group['who_all_can_send_messages'] === 'all') {
                    $send_message = true;
                } else {
                    $who_all_can_send_messages = json_decode($group['who_all_can_send_messages']);
                    if (!empty($who_all_can_send_messages)) {
                        if (in_array($group['group_role_id'], $who_all_can_send_messages)) {
                            $send_message = true;
                        }
                    }
                }
            }

            if ($send_message && !$super_privileges) {

                $send_message = false;

                if (role(['permissions' => ['groups' => 'send_message']])) {
                    if (role(['permissions' => ['messages' => 'send_message'], 'group_role_id' => $group['group_role_id']])) {
                        if (role(['permissions' => ['groups' => 'forward_messages']])) {
                            if (role(['permissions' => ['messages' => 'forward_messages'], 'group_role_id' => $group['group_role_id']])) {
                                $send_message = true;
                            }
                        }
                    }
                }
            }

            if ($send_message) {
                $forward_message = [
                    'user_id' => $current_user_id,
                    'group_id' => $group['group_id'],
                    'original_message' => $group_message['original_message'],
                    'filtered_message' => $group_message['filtered_message'],
                    'attachment_type' => $group_message['attachment_type'],
                    'attachments' => $group_message['attachments'],
                    'link_preview' => $group_message['link_preview'],
                    'created_on' => Registry::load('current_user')->time_stamp,
                    'updated_on' => Registry::load('current_user')->time_stamp
                ];

                DB::connect()->insert("group_messages", $forward_message);
                $load_group_id = $group['group_id'];
            }
        }



        $result = array();
        $result['success'] = true;

        if (!empty($load_group_id)) {
            $result['force_reload_aside'] = 'groups';
            $result['todo'] = 'load_conversation';
            $result['identifier_type'] = 'group_id';
            $result['identifier'] = $load_group_id;
        } else {
            $result['todo'] = 'refresh';
        }
    }
}

?>