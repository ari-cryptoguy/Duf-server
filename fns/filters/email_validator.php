<?php
$result = array();
$result["success"] = true;

if (filter_var($email_address, FILTER_VALIDATE_EMAIL)) {

    $email_domain = explode('@', $email_address);
    $email_domain = array_pop($email_domain);

    if (Registry::load('settings')->email_validator === 'enable') {

        $email_blacklist = array();
        $email_blacklist_file = 'assets/cache/email_blacklist.cache';

        if (file_exists($email_blacklist_file)) {
            include($email_blacklist_file);

            if (!empty($email_blacklist)) {
                if (in_array($email_domain, $email_blacklist)) {
                    $result["success"] = false;
                    $result["reason"] = 'blacklisted';
                }
            }
        }

    } else if (Registry::load('settings')->email_validator === 'strict_mode') {
        $email_whitelist = array();
        $email_whitelist_file = 'assets/cache/email_whitelist.cache';

        if (file_exists($email_whitelist_file)) {
            include($email_whitelist_file);

            if (!empty($email_whitelist)) {
                if (!in_array($email_domain, $email_whitelist)) {
                    $result["success"] = false;
                    $result["reason"] = 'not_whitelisted';
                }
            }
        }
    }

}
?>