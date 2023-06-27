<form class="guest_login_form form_element d-none" id="guest_login_form">
    <div class="d-none">
        <input type="hidden" name="add" value="guest_user" />

        <?php if (isset($_GET['redirect'])) {
            ?>
            <input type="hidden" name="redirect" value="<?php echo htmlspecialchars($_GET['redirect']) ?>" />
            <?php
        } ?>

    </div>
    <div class="field">
        <label><?php echo Registry::load('strings')->nickname ?></label>
        <input type="text" name="nickname" />
    </div>

    <div class="captcha_validation">
        <?php include 'layouts/entry_page/captcha_validation.php'; ?>
    </div>
</form>