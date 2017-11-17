<div class="contacts-form">
    <div class="contacts-form__title">
        Есть вопросы?<br>Пишите нам
    </div>
    <form>
        <div class="contacts-input-row">
            <input type="text" name="name" class="contacts-input uk-input" placeholder="Представьтесь">
        </div>
        <div class="contacts-input-row">
            <input type="email" name="email" class="contacts-input uk-input" placeholder="Электронная почта*" required>
        </div>
        <div class="contacts-input-row">
            <input type="tel" name="phone" class="contacts-input uk-input" placeholder="Укажите телефон">
        </div>
        <div class="contacts-textarea-row">
            <textarea name="message" class="contacts-textarea uk-textarea" rows="5" placeholder="Сообщение"></textarea>
        </div>
        <div class="contacts-input-row uk-flex uk-flex-top">
            <input type="checkbox" id="contacts-conditions" name="conditions" class="contacts-checkbox" required>
            <label for="contacts-conditions" class="contacts__conditions">
                 Нажимая “Отправить”, подтверждаю, что прочитал(-а)
                <a href="{'page.agreement' | config | url}">Конфиденциальное соглашение</a> и соглашаюсь с
                <a href="{'page.policy' | config | url}">Политикой обработки персональных данных</a>
            </label>
        </div>
        <button class="uk-button button-intro button-intro--contacts">Отправить<span class="button-arrow"></span></button>
        <input type="hidden" name="nomail" value="nomail">
    </form>
</div>