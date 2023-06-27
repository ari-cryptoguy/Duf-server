<?php

if (role(['permissions' => ['super_privileges' => 'customizer']])) {

    $form = array();
    $form['loaded'] = new stdClass();
    $form['loaded']->title = Registry::load('strings')->custom_css;
    $form['loaded']->button = Registry::load('strings')->update;

    $custom_css_chat_page = $custom_css_entry_page = $custom_css_landing_page = $custom_css_global = '';

    $custom_css = file_get_contents("assets/css/common/custom_css.css");
    $custom_css_global = htmlspecialchars(trim($custom_css), ENT_QUOTES, 'UTF-8');

    if (file_exists('assets/css/chat_page/custom_css.css')) {
        $custom_css = file_get_contents("assets/css/chat_page/custom_css.css");
        $custom_css_chat_page = htmlspecialchars(trim($custom_css), ENT_QUOTES, 'UTF-8');
    }

    if (file_exists('assets/css/entry_page/custom_css.css')) {
        $custom_css = file_get_contents("assets/css/entry_page/custom_css.css");
        $custom_css_entry_page = htmlspecialchars(trim($custom_css), ENT_QUOTES, 'UTF-8');
    }

    if (file_exists('assets/css/landing_page/custom_css.css')) {
        $custom_css = file_get_contents("assets/css/landing_page/custom_css.css");
        $custom_css_landing_page = htmlspecialchars(trim($custom_css), ENT_QUOTES, 'UTF-8');
    }

    $form['fields'] = new stdClass();

    $form['fields']->update = [
        "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => "custom_css"
    ];


    $form['fields']->page = [
        "title" => Registry::load('strings')->select_a_page, "tag" => 'select', "class" => 'field toggle_form_fields'
    ];
    $form['fields']->page["attributes"] = [
        "hide_field" => "page_custom_css",
        "show_fields" => "chat_page|chat_page_custom_css,entry_page|entry_page_custom_css,landing_page|landing_page_custom_css,global_css|global_custom_css"
    ];

    $form['fields']->page['options'] = [
        "chat_page" => Registry::load('strings')->chat_page,
        "entry_page" => Registry::load('strings')->entry_page,
        "landing_page" => Registry::load('strings')->landing_page,
        "global_css" => Registry::load('strings')->global_css,
    ];

    $form['fields']->custom_css_chat_page = [
        "title" => Registry::load('strings')->css_code.' ['.Registry::load('strings')->chat_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_css d-none chat_page_custom_css',
        "value" => $custom_css_chat_page
    ];

    $form['fields']->custom_css_chat_page["attributes"] = [
        "rows" => 8, "id" => "chat_page_form_code_editor",
        "code_editor_id" => "chat_page_form_code_editor",
        "code_editor_mode" => "css"
    ];

    $form['fields']->custom_css_entry_page = [
        "title" => Registry::load('strings')->css_code.' ['.Registry::load('strings')->entry_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_css d-none entry_page_custom_css',
        "value" => $custom_css_entry_page
    ];

    $form['fields']->custom_css_entry_page["attributes"] = [
        "rows" => 8, "id" => "entry_page_form_code_editor",
        "code_editor_id" => "entry_page_form_code_editor",
        "code_editor_mode" => "css"
    ];

    $form['fields']->custom_css_landing_page = [
        "title" => Registry::load('strings')->css_code.' ['.Registry::load('strings')->landing_page.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_css d-none landing_page_custom_css',
        "value" => $custom_css_landing_page
    ];

    $form['fields']->custom_css_landing_page["attributes"] = [
        "rows" => 8, "id" => "landing_page_form_code_editor",
        "code_editor_id" => "landing_page_form_code_editor",
        "code_editor_mode" => "css"
    ];

    $form['fields']->global_css = [
        "title" => Registry::load('strings')->css_code.' ['.Registry::load('strings')->global_css.']',
        "tag" => 'textarea', "closetag" => true,
        "class" => 'field code_editor page_custom_css d-none global_custom_css',
        "value" => $custom_css_global
    ];

    $form['fields']->global_css["attributes"] = [
        "rows" => 8, "id" => "global_css_form_code_editor",
        "code_editor_id" => "global_css_form_code_editor",
        "code_editor_mode" => "css"
    ];

}
?>