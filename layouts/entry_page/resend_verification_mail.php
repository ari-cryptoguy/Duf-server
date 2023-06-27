<?php

if (isset($_GET['user']) && !empty($_GET['user'])) {
    $user = $_GET['user'];
    $columns = $join = $where = null;
    $alert_message = Registry::load('strings')->resend_email_on_error;
    $alert_type = 'warning';
    $update_data = array();

    $columns = ['site_users.user_id', 'site_users.email_address', 'site_roles.site_role_attribute','site_users.verification_code'];

    $join["[>]site_roles"] = ['site_users.site_role_id' => 'site_role_id'];
    $where["OR"] = ["site_users.username" => $user, "site_users.email_address" => $user];
    $where["LIMIT"] = 1;

    $validate_user = DB::connect()->select('site_users', $join, $columns, $where);

    if (isset($validate_user[0])) {
        if ($validate_user[0]['site_role_attribute'] === 'unverified_users') {

            include('fns/mailer/load.php');

            $user_id = $validate_user[0]['user_id'];
            $verification_code = $validate_user[0]['verification_code'];
            $verification_link = Registry::load('config')->site_url.'entry/verify_email_address/'.$user_id.'/'.$verification_code;

            $mail = array();
            $mail['email_addresses'] = $validate_user[0]['email_address'];
            $mail['category'] = 'verification';
            $mail['user_id'] = $user_id;
            $mail['parameters'] = ['link' => $verification_link];
            $mail['send_now'] = true;
            mailer('compose', $mail);

            $alert_message = Registry::load('strings')->email_successfully_sent;
            $alert_type = 'success';

        }
    }
}