<?php

$additional_attributes = '';

if (isset(Registry::load('settings')->captcha) && Registry::load('settings')->captcha === 'google_recaptcha_v2') {
    if (Registry::load('current_user')->color_scheme === 'dark_mode') {
        $additional_attributes = ' data-theme="dark"';
    }
    ?>
    <div class="captcha_box g-recaptcha" <?php echo $additional_attributes; ?> data-sitekey="<?php echo Registry::load('settings')->captcha_site_key; ?>"></div>
    <?php
} else if (isset(Registry::load('settings')->captcha) && Registry::load('settings')->captcha === 'hcaptcha') {

    if (Registry::load('current_user')->color_scheme === 'dark_mode') {
        $additional_attributes = ' data-theme="dark"';
    }

    ?>
    <div class="captcha_box h-captcha" <?php echo $additional_attributes; ?> data-sitekey="<?php echo Registry::load('settings')->captcha_site_key; ?>"></div>
    <?php
} ?>