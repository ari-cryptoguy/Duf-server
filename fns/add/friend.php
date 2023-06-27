<?php

$result = array();
$result['success'] = false;
$result['error_message'] = Registry::load('strings')->went_wrong;
$result['error_key'] = 'something_went_wrong';

$current_user_id = Registry::load('current_user')->id;

if (Registry::load('settings')->friend_system === 'enable') {
    if (isset($data['user_id'])) {

        $user_id = filter_var($data["user_id"], FILTER_SANITIZE_NUMBER_INT);

        if (!empty($user_id)) {
            if (role(['permissions' => ['friend_system' => 'send_requests']])) {

                if ((int)$user_id === (int)$current_user_id) {
                    return false;
                }

                $columns = $join = $where = null;
                $columns = ['friends.friendship_id'];

                $where["OR"]["AND #first_query"] = [
                    "friends.from_user_id" => $user_id,
                    "friends.to_user_id" => $current_user_id,
                ];
                $where["OR"]["AND #second_query"] = [
                    "friends.from_user_id" => $current_user_id,
                    "friends.to_user_id" => $user_id,
                ];

                $where["LIMIT"] = 1;

                $check_friend_list = DB::connect()->select('friends', $columns, $where);

                if (!isset($check_friend_list[0])) {


                    $user_site_role_id = DB::connect()->select('site_users', ['site_role_id'], ['user_id' => $user_id, 'LIMIT' => 1]);

                    if (isset($user_site_role_id[0])) {
                        $user_site_role_id = $user_site_role_id[0]['site_role_id'];
                        
                        if (role(['permissions' => ['friend_system' => 'receive_requests'], 'site_role_id' => $user_site_role_id])) {
                            DB::connect()->insert("friends", [
                                "from_user_id" => $current_user_id,
                                "to_user_id" => $user_id,
                                "created_on" => Registry::load('current_user')->time_stamp,
                                "updated_on" => Registry::load('current_user')->time_stamp,
                            ]);
                        }
                    }
                }

                $result = array();
                $result['success'] = true;
                $result['todo'] = 'reload';
                $result['reload'] = ['site_users', 'online', 'friends', 'group_members'];

                if (isset($data['info_box'])) {
                    $result['info_box']['user_id'] = $user_id;
                }
            }
        }
    }
}