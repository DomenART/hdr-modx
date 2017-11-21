<footer class="uk-container">
    <section class="footer-first">
        <div class="uk-grid" uk-grid>
            <div class="uk-width-2-5@m">
                <a href="/"><img src="assets/template/img/logo.png" alt="" class="footer__logo"></a>
                <ul class="footer__rights">
                    <li><a href="{'page.agreement' | config | url}">Пользовательское соглашение</a></li>
                    <li><a href="{'page.policy' | config | url}">Политика обработки персональных данных</a></li>
                </ul>
            </div>

            <div class="uk-width-3-5@m">
                <div class="uk-grid" uk-grid>
                    <div class="uk-width-1-2@s uk-width-expand@m">
                        <div class="footer__title">Наш офис</div>
                        <table class="footer__contacts">
                            <tr>
                                <td>Севастополь:</td>
                                <td>
                                    +7 (978) 070-43-33<br> +7 (978) 042-24-43
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><br></td>
                            </tr>
                            <tr>
                                <td>Москва:</td>
                                <td>+7 (985) 875-29-17</td>
                            </tr>
                            <tr>
                                <td colspan="2"><br></td>
                            </tr>
                            <tr>
                                <td>E-mail:</td>
                                <td><a href="mailto:{'site.email' | config}">{'site.email' | config}</a></td>
                            </tr>
                        </table>
                    </div>

                    <div class="uk-width-1-2@s uk-width-1-4@m">
                        <div class="footer__title">Время работы</div>
                        <table class="footer__contacts">
                            <tr>
                                <td>Пн-пт:</td>
                                <td>
                                    с 10:00 до 19:00
                                </td>
                            </tr>
                            <tr>
                                <td>Сб-вс:</td>
                                <td>Выходные</td>
                            </tr>
                        </table>
                    </div>

                    <div class="uk-width-1-2@s uk-width-1-4@m">
                        <div class="footer__title">Портфолио</div>
                        {'pdoMenu' | snippet : [
                            'outerClass' => 'footer__menu',
                            'parents' => 'page.portfolio' | config,
                            'level' => 0
                        ]}
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="footer-second">
        <div class="uk-grid uk-flex-middle" uk-grid>
            <div class="uk-width-2-5@m">
                <div class="footer__copyright">
                    {'site.copyright' | config}
                </div>
                <div></div>
            </div>

            <div class="uk-width-3-5@m">
                <div class="footer__right uk-flex uk-flex-between uk-flex-middle">
                    <div class="uk-flex uk-flex-between uk-flex-middle uk-width-1-1 uk-width-auto@s">
                        <a href="{'page.sitemap' | config | url}" class="footer__sitemap">Карта сайта</a>
                        <div class="footer__counters">
                            {'site.counters' | config}
                        </div>
                    </div>
                    <a href="http://domenart-studio.ru" class="footer__creator" target="_blank">Разработка сайта</a>
                </div>
            </div>
        </div>
    </section>
</footer>

<div class="scrolltop" uk-scroll>
    <span uk-icon="icon: chevron-up; ratio: 1.4"></span>
</div>

{'!AjaxForm@Form' | snippet : [
    'emailSubject'  => 'Заказ консультации',
    'validate'      => 'nomail:blank,email:email:required,conditions:required',
    'form'          => '@FILE chunks/forms/consultation.tpl'
]}