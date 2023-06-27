<?php

if (role(['permissions' => ['super_privileges' => 'customizer']])) {

    $form = array();
    $form['loaded'] = new stdClass();
    $form['loaded']->title = Registry::load('strings')->custom_js;
    $form['loaded']->button = Registry::load('strings')->update;

    $custom_js_chat_page = $custom_js_entry_page = $custom_js_landing_page = $custom_js_global = '';

    if (file_exists('assets/js/common/custom_js.js')) {
        $custom_js = file_get_contents("assets/js/common/custom_js.js");
        $custom_js_global = htmlspecialchars(trim($custom_js), ENT_QUOTES, 'UTF-8');
    }

    if (file_exists('assets/js/chat_page/custom_js.js')) {
        $custom_js = file_get_contents("assets/js/chat_page/custom_js.js");
        $custom_js_chat_page = htmlspecialchars(trim($custom_js), ENT_QUOTES, 'UTF-8');
    }

    if (file_exists('assets/js/entry_page/custom_js.js')) {
        $custom_js = file_get_contents("assets/js/entry_page/custom_js.js");
        $custom_js_entry_page = htmlspecialchars(trim($custom_js), ENT_QUOTES, 'UTF-8');
    }

    if (file_exists('assets/js/landing_page/custom_js.js')) {
        $custom_js = file_get_contents("assets/js/landing_page/custom_js.js");
        $custom_js_landing_page = htmlspecialchars(trim($custom_js), ENT_QUOTES, 'UTF-8');
    }

    $form['fields'] = new stdClass();

    $form['fields']->update = [
        "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => "custom_js"
    ];


    $form['fields']->page = [
        "title" => Registry::load('strings')->select_a_page, "tag" => 'select', "class" => 'field toggle_form_fields'
    ];
    $form['fields']->page["attributes"] = [
        "hide_field" => "page_custom_js",
        "show_fields" => "chat_page|chat_page_custom_js,entry_page|entry_page_custom_js,landing_page|landing_page_custom_js,global_js|global_custom_js"
    ];

    $form['fields']->page['options'] = [
        "chat_page" => Registry::load('strings')->chat_page,
        "entry_page" => Registry::load('strings')->entry_page,
        "landing_page" => Registry::load('strings')->landing_page,
        "global_js" => Registry::load('strings')->global_js,
    ];

    $form['fields']->custom_js_chat_page = [
        "title" => Registry::load('strings')->javascript.' ['.Registry::load('strings')->chat_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_js d-none chat_page_custom_js',
        "value" => $custom_js_chat_page
    ];

    $form['fields']->custom_js_chat_page["attributes"] = [
        "rows" => 8, "id" => "chat_page_form_code_editor",
        "code_editor_id" => "chat_page_form_code_editor",
        "code_editor_mode" => "javascript"
    ];

    $form['fields']->custom_js_entry_page = [
        "title" => Registry::load('strings')->javascript.' ['.Registry::load('strings')->entry_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_js d-none entry_page_custom_js',
        "value" => $custom_js_entry_page
    ];

    $form['fields']->custom_js_entry_page["attributes"] = [
        "rows" => 8, "id" => "entry_page_form_code_editor",
        "code_editor_id" => "entry_page_form_code_editor",
        "code_editor_mode" => "javascript"
    ];

    $form['fields']->custom_js_landing_page = [
        "title" => Registry::load('strings')->javascript.' ['.Registry::load('strings')->landing_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_js d-none landing_page_custom_js',
        "value" => $custom_js_landing_page
    ];

    $form['fields']->custom_js_landing_page["attributes"] = [
        "rows" => 8, "id" => "landing_page_form_code_editor",
        "code_editor_id" => "landing_page_form_code_editor",
        "code_editor_mode" => "javascript"
    ];

    $form['fields']->global_js = [
        "title" => Registry::load('strings')->javascript.' ['.Registry::load('strings')->global_js.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_js d-none global_custom_js',
        "value" => $custom_js_global
    ];

    $form['fields']->global_js["attributes"] = [
        "rows" => 8, "id" => "global_js_form_code_editor",
        "code_editor_id" => "global_js_form_code_editor",
        "code_editor_mode" => "javascript"
    ];

}
?>