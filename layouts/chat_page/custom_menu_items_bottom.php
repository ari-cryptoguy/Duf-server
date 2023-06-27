<?php

foreach ($custom_menu_items as $menu_item) {

    if (!empty($menu_item['show_on_chat_page'])) {
        $skip_menu_item = false;

        if ($menu_item['menu_item_visibility'] !== 'all') {
            $menu_item_visibility = json_decode($menu_item['menu_item_visibility']);
            if (!in_array(Registry::load('current_user')->site_role, $menu_item_visibility)) {
                $skip_menu_item = true;
            }
        }


        if (!$skip_menu_item) {
            $menu_item_title = $menu_item['string_constant'];
            $menu_item_attributes = '';

            if (!empty($menu_item['page_id'])) {
                $menu_item_attributes .= 'class="load_page"';
                $menu_item_attributes .= 'page_id="'.$menu_item['page_id'].'"';
            } else {
                $menu_item_attributes .= 'class="open_link"';
                $menu_item_attributes .= 'link="'.$menu_item['web_address'].'"';

                if (!empty($menu_item['link_target'])) {
                    $menu_item_attributes .= 'target="_blank"';
                }
            }

            ?>


            <li <?php echo $menu_item_attributes ?>>
                <div class="menu_item">
                    <span class="icon">
                        <i class="<?php echo $menu_item['menu_icon_class'] ?>"></i>
                    </span>
                    <span class="title">
                        <?php echo Registry::load('strings')->$menu_item_title; ?>
                    </span>
                </div>
            </li>

            <?php
        }
    }
}
?>