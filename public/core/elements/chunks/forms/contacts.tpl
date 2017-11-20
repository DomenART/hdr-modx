<div class="contacts-form">
    <div class="contacts-form__title">
        Есть вопросы?<br>Пишите нам
    </div>
    <form action="{$_modx->resource.uri}" method="post" class="ajax_form">
        <div class="contacts-input-row">
            <input type="text" name="name" class="uk-input input-notebook" placeholder="Представьтесь">
        </div>
        <div class="contacts-input-row">
            <input type="email" name="email" class="uk-input input-notebook" placeholder="Электронная почта*" required>
        </div>
        <div class="contacts-input-row">
            <input type="tel" name="phone" class="uk-input input-notebook" placeholder="Укажите телефон">
        </div>
        <div class="contacts-textarea-row">
            <textarea name="message" class="uk-textarea textarea-notebook" rows="4" placeholder="Сообщение"></textarea>
        </div>
        <div class="contacts-input-row uk-flex uk-flex-top">
            <input type="checkbox" id="contacts-conditions" name="conditions" class="uk-checkbox uk-margin-small-right" checked required>
            <label for="contacts-conditions" class="contacts__conditions">
                 Нажимая “Отправить”, подтверждаю, что прочитал(-а)
                <a href="{'page.agreement' | config | url}">Конфиденциальное соглашение</a> и соглашаюсь с
                <a href="{'page.policy' | config | url}">Политикой обработки персональных данных</a>
            </label>
        </div>
        <button class="uk-button button-intro contacts-form__submit">Отправить<span class="button-arrow"></span></button>
        <input type="hidden" name="nomail" value="nomail">
    </form>
</div>