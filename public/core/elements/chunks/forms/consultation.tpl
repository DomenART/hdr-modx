<div id="consultation" uk-modal>
    <div class="modal-form uk-modal-dialog uk-modal-body">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="modal-form__title">
             Есть вопросы?
            <br>Пишите нам
        </div>
        <form>
            <div class="uk-margin">
                <input type="text" name="name" class="contacts-input uk-input" placeholder="Представьтесь">
            </div>
            <div class="uk-margin">
                <input type="email" name="email" class="contacts-input uk-input" placeholder="Электронная почта*" required>
            </div>
            <div class="uk-margin">
                <input type="tel" name="phone" class="contacts-input uk-input" placeholder="Укажите телефон">
            </div>
            <div class="uk-margin">
                <textarea name="message" class="contacts-textarea uk-textarea" rows="3" placeholder="Сообщение"></textarea>
            </div>
            <div class="uk-margin uk-flex uk-flex-top">
                <input type="checkbox" id="contacts-conditions" name="conditions" class="contacts-checkbox" required>
                <label for="contacts-conditions" class="contacts__conditions">
                     Нажимая “Отправить”, подтверждаю, что прочитал(-а)
                    <a href="{'page.agreement' | config | url}">Конфиденциальное соглашение</a> и соглашаюсь с
                    <a href="{'page.policy' | config | url}">Политикой обработки персональных данных</a>
                </label>
            </div>
            <div class="uk-text-center">
                <button class="uk-button button-intro">Отправить<span class="button-arrow"></span></button>
                <input type="hidden" name="nomail" value="nomail">
            </div>
        </form>
</div>