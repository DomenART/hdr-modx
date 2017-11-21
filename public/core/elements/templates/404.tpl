<!doctype html>
<html class="page page--404" lang="en">
<head>
    {include 'file:partials/head.tpl'}
</head>
<body>
<div class="wrapper">
    {include 'file:partials/toolbar.tpl'}

    <div class="uk-flex uk-flex-column" uk-height-viewport>
        <div class="uk-height-1-1 uk-flex uk-flex-center uk-flex-middle">

            <div class="page-404-content">
                <div class="page-404-content__code">404</div>
                <div class="page-404-content__text">страница не найдена</div>
                <a href="/" class="page-404-content__back">
                    <span class="button-arrow"></span>
                    Вернуться назад
                </a>
            </div>

        </div>
        <div class="uk-width-1-1">

            <footer class="uk-container">
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

        </div>
    </div>
</div>

<script src="assets/template/main.js?v={rand()}"></script>
</body>
</html>