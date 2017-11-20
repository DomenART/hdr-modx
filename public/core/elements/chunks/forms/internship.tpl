<form action="{$_modx->resource.uri}" method="post" class="internship-form ajax_form">
    <div class="internship-form__row">
        <label for="intern-name">Имя</label>
        <input type="text" name="name" id="intern-name" class="uk-input" placeholder="Имя">
    </div>
    <div class="internship-form__row">
        <label for="intern-tel">Телефон
            <span class="form-required">*</span>
        </label>
        <input name="phone" type="tel" id="intern-tel" class="uk-input" placeholder="+7 123 000 00 00" required>
    </div>
    <div class="internship-form__row">
        <label for="intern-email">E-mail</label>
        <input type="text" name="email" id="intern-email" class="uk-input" placeholder="mail@mail.com">
    </div>
    <div class="internship-form__row">
        <input type="checkbox" id="contacts-conditions" name="conditions" class="uk-checkbox uk-margin-small-right" checked required>
        <label for="contacts-conditions" class="contacts__conditions">
                Нажимая “Отправить”, подтверждаю, что прочитал(-а)
            <a href="{'page.agreement' | config | url}">Конфиденциальное соглашение</a> и соглашаюсь с
            <a href="{'page.policy' | config | url}">Политикой обработки персональных данных</a>
        </label>
    </div>
    <button type="submit" class="uk-button button-gray">Отправить<span class="button-arrow"></span></button>
</form>