{extends 'file:templates/master.tpl'}

{block 'content'}
<header class="page-header">
	<div class="uk-container">
		<div class="breadcrumb uk-flex uk-flex-center">
		    {'pdoCrumbs' | snippet : [
		        'showHome' => '1',
		        'tplWrapper' => '@INLINE <ul class="uk-breadcrumb">{$output}</ul>'
		    ]}
		</div>
		<h1 class="pagetitle">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
		<div class="prices__text">
			{$_modx->resource.content}
		</div>
	</div>
</header>
<main class="page-main page-main--prices">
	<section class="prices-services">
		<div class="uk-container">
			<div class="section-title section-title--dark section-title--prices ">
				<span class="section-title__text">
					Цены на услуги House Design Room
				</span>
			</div>
			<div class="uk-grid uk-grid-collapse uk-child-width-1-2@s uk-child-width-1-4@l" uk-height-match="target: .services-item__text"  uk-scrollspy="target: > div; cls: uk-animation-slide-bottom-medium; delay: 300">
				{foreach $_modx->resource['prices.pricelist'] | json_decode as $row}
					<div class="services-item" style="background-image: url('{$row.image}')">
						<div class="services-item__title">{$row.title | nl2br}</div>
						<div class="services-item__text">{$row.desc | nl2br}</div>
						<div class="services-item__price">
							<span>{$row.price}</span>
							руб/м<sup>2</sup>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</section>
	<section class="prices-packages">
		<div class="uk-container">
			<div class="section-title section-title--dark">
				<span class="section-title__text">
					Пакеты
				</span>
			</div>
			<div class="js-packages-wrapper uk-grid uk-grid-collapse uk-child-width-1-2@s uk-child-width-1-4@m" uk-grid>
				{foreach $_modx->resource['prices.packages'] | json_decode as $row}
					<div class="packages-item">
						<div class="packages-item__title uk-flex uk-flex-middle uk-flex-center">«{$row.title}»</div>
						<div class="packages-item__desc uk-flex uk-flex-middle uk-flex-center">{$row.subtitle}</div>
						<div class="packages-item__actual-price">
							<span>{$row.price}</span>
							<sup class="packages-item__unit">
								руб/м<sup>2</sup>
							</sup>
						</div>
						<div class="packages-item__old-price">
							{$row.oldprice} руб.
						</div>
						<div class="packages-item__text">
							{$row.desc | nl2br}
						</div>
						<div class="packages-item__button">
							<a href="{$row.link}" class="uk-button button-gray">Заказать<span class="button-arrow"></span></a>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</section>
	<section class="prices-cost">
		<div class="uk-container">
			<div class="section-title section-title--white">
				<span class="section-title__text">
					ЧТО ВХОДИТ В СТОИМОСТЬ?
				</span>
			</div>
			<div class="uk-grid uk-child-width-1-2@m">
				<div>
					<div class="consult consult--prices" uk-parallax="y: 300">
						<div class="consult__title">С ЧЕГО НАЧАТЬ?</div>
						<div class="consult__text">
							Запишитесь на консультацию<br>
							с возможностью выезда на ваш объект
						</div>
						<button class="uk-button button-framed button-intro--consult" uk-toggle="target: #consultation">Записаться<span class="button-arrow"></span></button>
					</div>
				</div>
				<div class="uk-flex-first uk-flex-last@m">
					<div class="prices-cost__text">
						{$_modx->resource['prices.cost']}
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="prices-composition">
		<div class="uk-container">
			<div class="section-title section-title--dark">
				<span class="section-title__text">
					СОСТАВ ДИЗАЙН-ПРОЕКТА
				</span>
			</div>
			<div class="uk-grid uk-child-width-1-2@xl">
				<div>
					<div class="prices-composition-slider" id="slideshow" uk-slideshow>
						<div class="composition-slider">
							<img src="assets/template/img/composition-slider.png">
							<ul class="composition-slider__content uk-slideshow-items">
								{foreach $_modx->resource['prices.slider'] | json_decode as $row}
									<li style="background-image: url('{$row.image}')"></li>
								{/foreach}
							</ul>
						</div>
						<div class="composition-slider__control uk-flex uk-flex-right uk-flex-middle">
							<div class="slide-bar__arrows">
								<span uk-slideshow-item="previous"><i uk-icon="icon: chevron-left"></i></span>
								<span uk-slideshow-item="next"><i uk-icon="icon: chevron-right"></i></span>
							</div>
							<div class="composition-slider__counter">
								<span class="composition-slider__active js-slideshow-index">
									</span>
								<span class="composition-slider__of">из</span>
								<span>
									{count($_modx->resource['prices.slider'] | json_decode)}
								</span>
							</div>
						</div>
					</div>
				</div>
				<div>
					<ol class="prices-compostion__list">
						{foreach $_modx->resource['prices.slider'] | json_decode as $row}
							<li>{$row.text}</li>
						{/foreach}
					</ol>
				</div>
			</div>
		</div>
	</section>
	<section class="prices-calculations">
		<div class="uk-container">
			<div class="section-title section-title--dark">
				<span class="section-title__text">
					РАССЧИТАТЬ СТОИМОСТЬ
				</span>
			</div>
			<div class="prices-calculations__text">
				Узнайте сколько вам нужно будет потратить на: дизайнера, мебель, технику, материалы и отделочные работы. Мы бесплатно проконсультируем, о том где можно купить как дорогие, качественные материалы, так и недорогие с хорошим соотношением цена/качества.
			</div>
			<div class="calculation__container">
				{'!AjaxForm@Form' | snippet : [
					'emailSubject'  => 'Расчёт стоимости',
					'validate'      => 'nomail:blank,phone:tel:required,conditions:required',
					'form'          => '@FILE chunks/forms/calculation.tpl'
				]}
			</div>
		</div>
	</section>
</main>
{/block}
