<?php

if (role(['permissions' => ['super_privileges' => 'group_headers']])) {

    $form = array();

    $form['loaded'] = new stdClass();
    $form['fields'] = new stdClass();

    if (isset($load['group_id'])) {

        $load["group_id"] = filter_var($load["group_id"], FILTER_SANITIZE_NUMBER_INT);

        if (!empty($load['group_id'])) {

            $columns = $where = $join = null;

            $columns = [
                'groups.name(group_name)', 'groups.group_header_status',
            ];

            $where['AND'] = ['groups.group_id' => $load['group_id']];
            $where['LIMIT'] = 1;

            $group_info = DB::connect()->select('groups', $columns, $where);

            if (isset($group_info[0])) {

                $group_info = $group_info[0];

                $form['loaded']->title = Registry::load('strings')->edit_group_header;
                $form['loaded']->button = Registry::load('strings')->update;

                $form['fields']->update = [
                    "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => "group_headers"
                ];


                $form['fields']->group_id = [
                    "tag" => 'input', "type" => 'hidden', "class" => 'd-none', "value" => $load['group_id']
                ];

                $form['fields']->group_name = [
                    "title" => Registry::load('strings')->group_name, "tag" => 'input', "type" => 'text',
                    "attributes" => ['disabled' => 'disabled'], "class" => 'field', "value" => $group_info['group_name'],
                ];


                $form['fields']->header_content = [
                    "title" => Registry::load('strings')->header_content, "tag" => 'textarea',
                    "class" => 'field code_editor',
                    "placeholder" => Registry::load('strings')->header_content
                ];

                $form['fields']->header_content["attributes"] = ["rows" => 6, "id" => "form_code_editor"];


                $form['fields']->disabled = [
                    "title" => Registry::load('strings')->disabled, "tag" => 'select', "class" => 'field',
                    "value" => "yes"
                ];
                $form['fields']->disabled['options'] = [
                    "yes" => Registry::load('strings')->yes,
                    "no" => Registry::load('strings')->no,
                ];

                if ((int)$group_info['group_header_status'] === 1) {
                    $form['fields']->disabled["value"] = "no";
                }

                $group_header_file = 'assets/group_headers/group_'.$load["group_id"].'.php';

                if (file_exists($group_header_file)) {
                    $form['fields']->header_content["value"] = file_get_contents($group_header_file);
                }

            }
        }
    }
}
?>