<?php

if (!empty(Registry::load('current_user')->site_role_attribute)) {
    if (Registry::load('current_user')->site_role_attribute === 'guest_users') {
        if (Registry::load('settings')->allow_guest_users_create_accounts === 'yes') {

            $form['loaded'] = new stdClass();
            $form['loaded']->title = Registry::load('strings')->create_account;
            $form['loaded']->button = Registry::load('strings')->create;

            $form['fields'] = new stdClass();
            $form['fields']->update = [
                "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => "guest_account"
            ];

            $form['fields']->email_address = [
                "title" => Registry::load('strings')->email_address, "tag" => 'input', "type" => 'email', "class" => 'field',
                "placeholder" => Registry::load('strings')->email_address,
            ];

            $form['fields']->password = [
                "title" => Registry::load('strings')->password, "tag" => 'input', "type" => 'password', "class" => 'field',
                "placeholder" => Registry::load('strings')->password,
            ];

            $form['fields']->confirm_password = [
                "title" => Registry::load('strings')->confirm_password, "tag" => 'input', "type" => 'password', "class" => 'field',
                "placeholder" => Registry::load('strings')->confirm_password,
            ];
        }
    }
}
?>