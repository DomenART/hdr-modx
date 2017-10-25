<div class="toolbar uk-flex uk-flex-middle">
    <a href="/" class="toolbar__sitename">
        <img src="assets/template/img/logo-toolbar.png" alt="">
    </a>
    <div class="toolbar__contacts">
        <span>Севастополь: +7(978) 070 43 33</span>
        <span>Москва: +7 (985) 875 29 17</span>
    </div>
    <div class="toolbar__social">
        <div class="social-links">
            <a href="#" class="social-links__item social-links__item--twitter"></a>
            <a href="#" class="social-links__item social-links__item--vk"></a>
            <a href="#" class="social-links__item social-links__item--instagram"></a>
            <a href="#" class="social-links__item social-links__item--youtube"></a>
        </div>
    </div>
</div>

<div class="menu-overlay" uk-toggle="target: html; cls: page--open-menu"></div>

<div class="menu">		
    <div class="menu__bg"></div>
    <div class="menu__title-bg"></div>
    <div class="menu__title-text">Меню</div>
    <div class="menu__toggle" uk-toggle="target: html; cls: page--open-menu">
        <div class="menu__toggle__logo"></div>
        <div class="menu__toggle__icon">
            <i></i>
            <i></i>
            <i></i>
        </div>
    </div>
    <div class="menu__close" uk-toggle="target: html; cls: page--open-menu"></div>
    {'pdoMenu' | snippet : [
        'level' => 1,
        'parents' => 0,
        'outerClass' => 'menu__list'
    ]}
</div>