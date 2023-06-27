<?php

$result = array();
$result['success'] = false;
$result['error_message'] = Registry::load('strings')->went_wrong;
$result['error_key'] = 'something_went_wrong';

$providers = ['onesignal', 'webpushr'];
$user_id = Registry::load('current_user')->id;
$device_token = 0;

if ($force_request) {
    if (isset($data['user'])) {
        $columns = $join = $where = null;

        $columns = ['site_users.user_id'];
        $where["OR"] = ["site_users.username" => $data['user'], "site_users.email_address" => $data['user']];
        $where["LIMIT"] = 1;

        $site_user = DB::connect()->select('site_users', $columns, $where);

        if (isset($site_user[0])) {
            $user_id = $site_user[0]['user_id'];
        } else {
            $result = array();
            $result['success'] = false;
            $result['error_message'] = Registry::load('strings')->account_not_found;
            $result['error_key'] = 'account_not_found';
            $result['error_variables'] = [];
            return;
        }
    }
}

if ($force_request || Registry::load('current_user')->logged_in) {
    if (!empty(Registry::load('settings')->push_notifications) && Registry::load('settings')->push_notifications !== 'disable') {

        $service_provider = Registry::load('settings')->push_notifications;

        if (isset($data['service_provider']) && in_array($data['service_provider'], $providers)) {
            $service_provider = $data['service_provider'];
        }

        if (isset($data['device_token'])) {
            $device_token = strip_tags($data["device_token"]);
            $device_token = str_replace('"', "", $device_token);
            $device_token = str_replace("'", "", $device_token);
            $device_token = htmlspecialchars($device_token, ENT_QUOTES);
        }

        $check_token_exists = DB::connect()->select("push_subscriptions", ['push_subscriber_id'], [
            "user_id" => $user_id,
            "device_token" => $device_token,
            "push_notification_service" => $service_provider,
            "LIMIT" => 1
        ]);

        if (!empty($device_token) && !empty($user_id) && !isset($check_token_exists[0])) {

            DB::connect()->insert("push_subscriptions", [
                "user_id" => $user_id,
                "device_token" => $device_token,
                "push_notification_service" => $service_provider,
                "created_on" => Registry::load('current_user')->time_stamp,
                "updated_on" => Registry::load('current_user')->time_stamp,
            ]);

            $result = array();
            $result['success'] = true;
        }
    }
}
?>