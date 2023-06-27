<?php

if (role(['permissions' => ['super_privileges' => 'email_validator']])) {

    $form = array();
    $form['loaded'] = new stdClass();
    $form['loaded']->title = Registry::load('strings')->email_validator;
    $form['loaded']->button = Registry::load('strings')->update;

    $email_blacklist = array();
    $email_blacklist_file = 'assets/cache/email_blacklist.cache';

    if (file_exists($email_blacklist_file)) {
        include($email_blacklist_file);

        if (!empty($email_blacklist)) {
            $email_blacklist = implode(PHP_EOL, $email_blacklist);
        }
    }

    $email_whitelist = array();
    $email_whitelist_file = 'assets/cache/email_whitelist.cache';

    if (file_exists($email_whitelist_file)) {
        include($email_whitelist_file);

        if (!empty($email_whitelist_file)) {
            $email_whitelist = implode(PHP_EOL, $email_whitelist);
        }
    }

    $form['fields'] = new stdClass();

    $form['fields']->update = [
        "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => "email_validator"
    ];


    $form['fields']->status = [
        "title" => Registry::load('strings')->status, "tag" => 'select', "class" => 'field showfieldon',
        "value" => Registry::load('settings')->email_validator
    ];
    $form['fields']->status['options'] = [
        "enable" => Registry::load('strings')->enable,
        "disable" => Registry::load('strings')->disable,
        "strict_mode" => Registry::load('strings')->strict_mode,
    ];

    $form['fields']->status["attributes"] = [
        "fieldclass" => "email_whitelist",
        "checkvalue" => "strict_mode",
        "hideclass" => "email_blacklist"
    ];


    $form['fields']->email_blacklist = [
        "title" => Registry::load('strings')->blacklist, "tag" => 'textarea', "class" => 'field email_blacklist d-none',
        "value" => $email_blacklist,
    ];

    $form['fields']->email_blacklist["attributes"] = ["rows" => 17];


    $form['fields']->email_whitelist = [
        "title" => Registry::load('strings')->whitelist, "tag" => 'textarea', "class" => 'field email_whitelist d-none',
        "value" => $email_whitelist,
    ];

    $form['fields']->email_whitelist["attributes"] = ["rows" => 17];

    if (Registry::load('settings')->email_validator === 'enable') {
        $form['fields']->email_blacklist['class'] = 'field email_blacklist';
    } else if (Registry::load('settings')->email_validator === 'strict_mode') {
        $form['fields']->email_whitelist['class'] = 'field email_whitelist';
    }

}

?>