<div class="calculation__tip">
    Введите ваши данные и мы рассчитаем стоимость дизайн проекта в 3-х категориях
    <br>
    <span class="form-required">*</span>Поле “Телефон” обязательно для заполнения
</div>
<form action="{$_modx->resource.uri}" method="post" class="ajax_form calculation">
    <div class="calculation__row">
        <div class="uk-grid" uk-grid>
            <div class="uk-width-1-2@m">
                <div class="uk-grid-collapse" uk-grid >
                    <div class="uk-width-1-6@s">
                        <div class="calculation__title">Стиль</div>
                    </div>
                    <div class="uk-width-5-6@s">
                        <select name="style" type="text" class="uk-select" placeholder="Классический">
                            <option>Классический</option>
                            <option>Современный</option>
                        </select>
                        <div class="calculation__desc">
                            Выберите стиль интерьера, который <br> вам больше нравится
                        </div>
                    </div>
                </div>
            </div>
            <div class="uk-width-1-2@m">
                <div class="uk-grid-collapse" uk-grid>
                    <div class="uk-width-1-6@s uk-width-1-4@m">
                        <div class="calculation__title">Площадь</div>
                    </div>
                    <div class="uk-width-5-6@s uk-width-3-4@m">
                        <div class="calculation__input-box uk-flex">
                            <input name="area" type="text" class="uk-input" placeholder="100"><div class="calculation__meter">м<sup>2</sup></div>
                        </div>
                        <div class="calculation__desc">
                            Введите площадь (по полу)<br>вашего помещения
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="calculation__row">
        <div class="uk-grid" uk-grid>
            <div class="uk-width-1-2@m">
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-6@s">
                        <div class="calculation__title">Место</div>
                    </div>
                    <div class="uk-width-5-6@s">
                        <input name="place-1" type="text" class="uk-input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
            <div class="uk-width-1-2@m">
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-6@s uk-width-1-4@m">
                        <div class="calculation__title">Место</div>
                    </div>
                    <div class="uk-width-5-6@s uk-width-3-4@m">
                        <input name="place-2" type="text" class="uk-input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
        </div>
        <div class="calculation__desc calculation__desc--wide">
            Введите город или название населенного пункта, где находится ваш объект
        </div>
    </div>
    <div class="calculation__row">
        <div class="uk-grid" uk-grid>
            <div class="uk-width-1-2@m">
                <div class="uk-grid-collapse" uk-grid >
                    <div class="uk-width-1-6@s">
                        <div class="calculation__title">Имя</div>
                    </div>
                    <div class="uk-width-5-6@s">
                        <input name="name" type="text" class="uk-input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
            <div class="uk-width-1-2@m">
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-6@s uk-width-1-4@m">
                        <div class="calculation__title">Телефон<span class="form-required">*</span></div>
                    </div>
                    <div class="uk-width-5-6@s uk-width-3-4@m">
                        <input name="phone" type="tel" class="uk-input" placeholder="+7 123 000 00 00" required>
                    </div>
                </div>
            </div>
        </div>
        <div class="calculation__desc calculation__desc--wide">
            Введите данные, по которым с вами можно связаться после расчета стоимости
        </div>
    </div>
    <div class="calculation__submit">
        <div class="uk-grid uk-flex-bottom" uk-grid>
            <div class="uk-width-2-3@m">
                <input name="conditions" id="calculation-check" type="checkbox" class="uk-checkbox" checked required>
                <div class="calculation__conditions">
                    <label for="calculation-check">
                        Нажимая “Отправить”, подтверждаю, что прочитал(-а)
                        <a href="{'page.agreement' | config | url}">Конфиденциальное соглашение</a> и соглашаюсь с
                        <a href="{'page.policy' | config | url}">Политикой обработки персональных данных</a>
                    </label>
                </div>
            </div>
            <div class="uk-width-1-3@m uk-text-center">
                <button type="submit" class="uk-button button-intro uk-width-1-1">Отправить
                    <span class="button-arrow"></span>
                </button>
            </div>
        </div>
    </div>
</form>