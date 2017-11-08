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