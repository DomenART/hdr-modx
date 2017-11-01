{extends 'file:templates/master.tpl'}
{block 'content'}
<header class="header-beige">
	<div class="header-substrate"></div>
	<div class="uk-container">
		<div class="breadcrumb uk-flex uk-flex-center">
			{'pdoCrumbs' | snippet : [
			'showHome' => '1',
			'tplWrapper' => '@INLINE <ul class="uk-breadcrumb">{$output}</ul>'
			]}
		</div>
		<h1 class="pagetitle">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
		<div></div>
	</div>
</header>
<main class="masterclass-background">
    <div class="uk-container">
        <article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
            <div class="masterclass-item__promo" style="background-image: url('assets/template/img/event.jpg')">
                <div class="masterclass-item__date">
                    <div class="masterclass-item__date-first">01</div>
                    <div class="masterclass-item__date-last">ноябрь `17</div>
                </div>
                <div class="masterclass-item__places">
                    Мест: <span>148</span>
                </div>
                <div class="masterclass-item__hours">
                    Длительность обучения: <span>148 часов</span>
                </div>
                <div class="masterclass-item__price">
                    Цена: <span>3 600 ₽</span>
                </div>  
                <a href="#" class="masterclass-item__invite">Пригласить друга</a>
            </div>
            <div class="masterclass-item__description">   
                <div class="master-class-item__expert uk-flex">
                    <div class="masterclass-item__photo">
                        <img src="assets/template/img/master.png" alt="">
                    </div>
                    <div>
                        <div class="masterclass-item__status">
                            Эксперт мастер-класса
                        </div>
                        <div class="masterclass-item__name">
                            Фамилия Имя Эксперта
                        </div>
                    </div>
                </div>
                <div class="masterclass-item__title">
                    Название мастер-класса, может быть в одну, 2-3 и более строк, но слишком длинный - не желательно 
                </div>
                <div class="masterclass-item__announcement">
                    Анонс мастер-класса, краткое описание или вступление... 
                </div>
                <a href="#" class="masterclass-item__more">Читать больше</a>
            </div>
        </article>
        <article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
                <div class="masterclass-item__promo" style="background-image: url('assets/template/img/event.jpg')">
                    <div class="masterclass-item__date">
                        <div class="masterclass-item__date-first">01</div>
                        <div class="masterclass-item__date-last">ноябрь `17</div>
                    </div>
                    <div class="masterclass-item__places">
                        Мест: <span>148</span>
                    </div>
                    <div class="masterclass-item__hours">
                        Длительность обучения: <span>148 часов</span>
                    </div>
                    <div class="masterclass-item__price">
                        Цена: <span>3 600 ₽</span>
                    </div>  
                    <a href="#" class="masterclass-item__invite">Пригласить друга</a>
                </div>
                <div class="masterclass-item__description">   
                    <div class="master-class-item__expert uk-flex">
                        <div class="masterclass-item__photo">
                            <img src="assets/template/img/master.png" alt="">
                        </div>
                        <div>
                            <div class="masterclass-item__status">
                                Эксперт мастер-класса
                            </div>
                            <div class="masterclass-item__name">
                                Фамилия Имя Эксперта
                            </div>
                        </div>
                    </div>
                    <div class="masterclass-item__title">
                        Название мастер-класса, может быть в одну, 2-3 и более строк, но слишком длинный - не желательно 
                    </div>
                    <div class="masterclass-item__announcement">
                        Анонс мастер-класса, краткое описание или вступление... 
                    </div>
                    <a href="#" class="masterclass-item__more">Читать больше</a>
                </div>
            </article>
            <article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
                    <div class="masterclass-item__promo" style="background-image: url('assets/template/img/event.jpg')">
                        <div class="masterclass-item__date">
                            <div class="masterclass-item__date-first">01</div>
                            <div class="masterclass-item__date-last">ноябрь `17</div>
                        </div>
                        <div class="masterclass-item__places">
                            Мест: <span>148</span>
                        </div>
                        <div class="masterclass-item__hours">
                            Длительность обучения: <span>148 часов</span>
                        </div>
                        <div class="masterclass-item__price">
                            Цена: <span>3 600 ₽</span>
                        </div>  
                        <a href="#" class="masterclass-item__invite">Пригласить друга</a>
                    </div>
                    <div class="masterclass-item__description">   
                        <div class="master-class-item__expert uk-flex">
                            <div class="masterclass-item__photo">
                                <img src="assets/template/img/master.png" alt="">
                            </div>
                            <div>
                                <div class="masterclass-item__status">
                                    Эксперт мастер-класса
                                </div>
                                <div class="masterclass-item__name">
                                    Фамилия Имя Эксперта
                                </div>
                            </div>
                        </div>
                        <div class="masterclass-item__title">
                            Название мастер-класса, может быть в одну, 2-3 и более строк, но слишком длинный - не желательно 
                        </div>
                        <div class="masterclass-item__announcement">
                            Анонс мастер-класса, краткое описание или вступление... 
                        </div>
                        <a href="#" class="masterclass-item__more">Читать больше</a>
                    </div>
                </article>
                <article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
                        <div class="masterclass-item__promo" style="background-image: url('assets/template/img/event.jpg')">
                            <div class="masterclass-item__date">
                                <div class="masterclass-item__date-first">01</div>
                                <div class="masterclass-item__date-last">ноябрь `17</div>
                            </div>
                            <div class="masterclass-item__places">
                                Мест: <span>148</span>
                            </div>
                            <div class="masterclass-item__hours">
                                Длительность обучения: <span>148 часов</span>
                            </div>
                            <div class="masterclass-item__price">
                                Цена: <span>3 600 ₽</span>
                            </div>  
                            <a href="#" class="masterclass-item__invite">Пригласить друга</a>
                        </div>
                        <div class="masterclass-item__description">   
                            <div class="master-class-item__expert uk-flex">
                                <div class="masterclass-item__photo">
                                    <img src="assets/template/img/master.png" alt="">
                                </div>
                                <div>
                                    <div class="masterclass-item__status">
                                        Эксперт мастер-класса
                                    </div>
                                    <div class="masterclass-item__name">
                                        Фамилия Имя Эксперта
                                    </div>
                                </div>
                            </div>
                            <div class="masterclass-item__title">
                                Название мастер-класса, может быть в одну, 2-3 и более строк, но слишком длинный - не желательно 
                            </div>
                            <div class="masterclass-item__announcement">
                                Анонс мастер-класса, краткое описание или вступление... 
                            </div>
                            <a href="#" class="masterclass-item__more">Читать больше</a>
                        </div>
                    </article>
    </div>
</main>
{/block}
    