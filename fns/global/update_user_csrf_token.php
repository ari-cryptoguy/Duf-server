<?php

if (isset(Registry::load('current_user')->login_session_id) && !empty(Registry::load('current_user')->login_session_id)) {

    $total_hours = 6;

    if (!empty(Registry::load('current_user')->csrf_token_generated_on)) {
        $d1 = new DateTime(Registry::load('current_user')->time_stamp);
        $d2 = new DateTime(Registry::load('current_user')->csrf_token_generated_on);
        $interval = $d1->diff($d2);
        $total_hours = ($interval->days * 24) + $interval->h;
    }

    if ($total_hours > 5) {
        Registry::load('current_user')->csrf_token = random_string(['length' => 20]);
        $update_token = [
            'csrf_token' => Registry::load('current_user')->csrf_token,
            'csrf_token_generated_on' => Registry::load('current_user')->time_stamp
        ];
        $where_session = [
            'login_session_id' => Registry::load('current_user')->login_session_id,
            'user_id' => Registry::load('current_user')->id,
        ];

        DB::connect()->update('login_sessions', $update_token, $where_session);
    }
}
?>