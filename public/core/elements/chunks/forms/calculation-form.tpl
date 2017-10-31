<form class="calculation">
    <div class="calculation__row uk-child-width-1-2@m" uk-grid>
        <div>
            <div class="uk-grid-collapse" uk-grid >
                <div class="uk-width-1-4@s">
                    <div class="calculation__title">Стиль</div>
                </div>
                <div class="uk-width-3-4@s">
                        <input type="text" class="uk-input calculation__input" placeholder="Классический">
                    <div class="calculation__desc">
                        Выберите стиль интерьера, который <br> вам больше нравится
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="uk-grid-collapse" uk-grid>
                <div class="uk-width-1-4@s">
                    <div class="calculation__title">Площадь</div>
                </div>
                <div class="uk-width-3-4@s">
                    <div class="calculation__input-box uk-flex">
                        <input type="text" class="uk-input calculation__input" placeholder="100"><div class="calculation__meter">м<sup>2</sup></div>
                    </div>
                    <div class="calculation__desc">
                        Введите площадь (по полу)<br>вашего помещения
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="calculation__row">
        <div class="uk-child-width-1-2@m" uk-grid>
            <div>
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-4@s">
                        <div class="calculation__title">Место</div>
                    </div>
                    <div class="uk-width-3-4@s">
                        <input type="text" class="uk-input calculation__input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
            <div>
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-4@s">
                        <div class="calculation__title">Место</div>
                    </div>
                    <div class="uk-width-3-4@s">
                        <input type="text" class="uk-input calculation__input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
        </div>
        <div class="calculation__desc calculation__desc--wide">
            Введите город или название населенного пункта, где находится ваш объект
        </div>
    </div>
    <div class="calculation__row">
        <div class="uk-child-width-1-2@m" uk-grid>
            <div>
                <div class="uk-grid-collapse" uk-grid >
                    <div class="uk-width-1-4@s">
                        <div class="calculation__title">Имя</div>
                    </div>
                    <div class="uk-width-3-4@s">
                        <input type="text" class="uk-input calculation__input" placeholder="Севастополь">
                    </div>
                </div>
            </div>
            <div>
                <div class="uk-grid uk-grid-collapse">
                    <div class="uk-width-1-4@s">
                        <div class="calculation__title">Телефон<span class="form-required">*</span></div>
                    </div>
                    <div class="uk-width-3-4@s">
                        <input type="tel" class="uk-input calculation__input" placeholder="+7 123 000 00 00" required>
                    </div>
                </div>
            </div>
        </div>
        <div class="calculation__desc calculation__desc--wide">
            Введите данные, по которым с вами можно связаться после расчета стоимости
        </div>
    </div>
    <div class="calculation__submit">
        <div class="uk-grid uk-grid-large uk-flex-middle">
            <div class="uk-width-2-3@s">
                <input id="calculation-check" type="checkbox" name="calculation-check" checked>
                <div class="calculation__conditions">
                    <label for="calculation-check">
                        Нажимая кнопку “Отправить”, подтверждаю, что прочитал(-а) <a href="#">Конфиденциальное соглашение</a> и соглашаюсь с <a href="#">Политикой обработки персональных данных</a>
                    </label>
                </div>
            </div>
            <div class="uk-width-1-3@s">
                <button type="submit" class="uk-button button-intro button-intro--calculation">Отправить<span class="button-arrow"></span></button>
            </div>
        </div>
    </div>
</form>