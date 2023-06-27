<form id="login_form" class="login_form form_element">
    <div class="field">
        <label><?php echo Registry::load('strings')->email_username ?></label>
        <input type="text" name="user" />
    </div>
    <div class="field">
        <label><?php echo Registry::load('strings')->password ?></label>
        <input type="password" name="password" />
    </div>

    <div class="field checkbox">
        <label>
            <input type="checkbox" name="remember_me" checked value="remember">
            <span class="checkmark"></span>
            <span class="text"><?php echo Registry::load('strings')->remember_me ?></span>
        </label>
    </div>
    <div class="d-none">
        <input type="hidden" name="add" value="login_session" />

        <?php if (isset($_GET['redirect'])) {
            ?>
            <input type="hidden" name="redirect" value="<?php echo htmlspecialchars($_GET['redirect']) ?>" />
            <?php
        } ?>

    </div>



    <div class="captcha_validation">
        <?php include 'layouts/entry_page/captcha_validation.php'; ?>
    </div>
</form>