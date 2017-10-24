{extends 'file:templates/master.tpl'}

{block 'content'}
	{set $slideshow = ($_modx->resource.slideshow | fromJSON)}
	<section class="slideshow" id="slideshow" uk-slideshow="animation: push">
		<ul class="slideshow__content uk-slideshow-items">
			{foreach $slideshow as $row}
				<li class="slide uk-flex uk-flex-middle uk-flex-center">
					<div class="uk-position-cover" uk-slideshow-parallax="scale: 1.2,1.2,1">
						<img src="{$row['image']}" alt="" uk-cover>
					</div>
					<div class="slide__inner" uk-slideshow-parallax="scale: 1,1,0.8">
						<div class="slide__type">{$row['type']}</div>
						<div class="slide__title">{$row['title']}</div>
						<div class="slide__desc">{$row['desc']}</div>
						<div class="slide__more">
							<a href="{$row['url']}" class="uk-button button-intro">Узнать больше<span class="button-arrow"></span></a>
						</div>
					</div>
				</li>
			{/foreach}
		</ul>
		<div class="slide-bar" id="slide-bar">
			<div class="slide-bar__arrows">
				<span uk-slideshow-item="previous"><i uk-icon="icon: chevron-left"></i></span>
				<span uk-slideshow-item="next"><i uk-icon="icon: chevron-right"></i></span>
			</div>
			<div class="slide-bar__count">
				<b class="js-slideshow-index"></b> из 3
			</div>
			<div class="slide-bar__social">
				<div class="social-links">
					<a href="#" class="social-links__item social-links__item--twitter"></a>
					<a href="#" class="social-links__item social-links__item--vk"></a>
					<a href="#" class="social-links__item social-links__item--instagram"></a>
					<a href="#" class="social-links__item social-links__item--youtube"></a>
				</div>
			</div>
			<a href="#second" class="slide-bar__arrow" uk-scroll><i uk-icon="icon: arrow-down; ratio: 1.2"></i></a>
		</div>
	</section>
	
	<section class="section-about" id="second">
		<div class="uk-container">
			<div class="section-about__desc">{$_modx->resource.description}</div>
			<h1 class="section-about__title">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
			<div class="section-about__content">{$_modx->resource.content}</div>
		</div>
	</section>
	<section class="section-comprasion">
		<div class="uk-container">
			<comprasion initial-images='{$_modx->resource.comprasion}'></comprasion>
		</div>
	</section>
	
	<section class="section-directions">
		<div class="uk-container">
			<div class="uk-grid uk-grid-collapse">
				<div class="uk-width-1-2@m">
					<a href="" class="direction-styles uk-flex uk-flex-middle">
						<span class="direction-styles__title">
							<span>Исторические стили интерьера</span>
						</span>
					</a>
				</div>
				<div class="uk-width-1-2@m direction-consult uk-flex">
					{include 'file:partials/consult.tpl'}
				</div>
				<div class="uk-width-1-2@m">
					<div class="direction-design uk-flex uk-flex-middle">
						<div class="direction-design__image"></div>
						<div class="direction-design__container">
							<div class="direction-design__title">Дизайн-проекты</div>
							<ul class="direction-design__list">
								<li><a href="">квартир</a></li>
								<li><a href="">загородных домов</a></li>
								<li><a href="">офисов</a></li>
								<li><a href="">коммерческой недвижимости</a></li>
								<li><a href="">общественных заведений</a></li>
								<li><a href="">магазинов, ресторанов и кафе</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="uk-width-1-2@m">
					<a href="" class="direction-planning uk-flex uk-flex-middle">
						<div class="direction-planning__image"></div>
						<span class="direction-planning__title">
							<span>Архитектурное проектирование</span>
						</span>
					</a>
				</div>
				<div class="uk-width-1-2@m"></div>
				<div class="uk-width-1-2@m">
					<a href="" class="direction-interior">
						<span>Качественный<br>и функциональный интерьер</span>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="section-portfolio">
		<div class="uk-container">
			<div class="section-title section-title--with-all">
				<span class="section-title__text">
					Портфолио
					<a href="#" class="view-all">смотреть все</a>
				</span>
			</div>
			<div class="uk-grid uk-grid-collapse uk-child-width-1-2@m">
				<div>
					<a href="#" class="portfolio-item uk-cover-container uk-flex uk-flex-column uk-flex-center uk-flex-middle">
						<img src="assets/template/img/project-1.jpg" alt="" class="portfolio-item__image" uk-cover>
						<span class="portfolio-item__title">Название проекта</span>
						<span class="portfolio-item__line"></span>
						<span class="portfolio-item__desc">Категория проекта</span>
					</a>
				</div>
				<div>
					<a href="#" class="portfolio-item uk-cover-container uk-flex uk-flex-column uk-flex-center uk-flex-middle">
						<img src="assets/template/img/project-2.jpg" alt="" class="portfolio-item__image" uk-cover>
						<span class="portfolio-item__title">Название проекта</span>
						<span class="portfolio-item__line"></span>
						<span class="portfolio-item__desc">Категория проекта</span>
					</a>
				</div>
				<div>
					<a href="#" class="portfolio-item uk-cover-container uk-flex uk-flex-column uk-flex-center uk-flex-middle">
						<img src="assets/template/img/project-3.jpg" alt="" class="portfolio-item__image" uk-cover>
						<span class="portfolio-item__title">Название проекта</span>
						<span class="portfolio-item__line"></span>
						<span class="portfolio-item__desc">Категория проекта</span>
					</a>
				</div>
				<div>
					<a href="#" class="portfolio-item uk-cover-container uk-flex uk-flex-column uk-flex-center uk-flex-middle">
						<img src="assets/template/img/project-4.jpg" alt="" class="portfolio-item__image" uk-cover>
						<span class="portfolio-item__title">Название проекта</span>
						<span class="portfolio-item__line"></span>
						<span class="portfolio-item__desc">Категория проекта</span>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="section-working">
		<div class="uk-container">
			<div class="section-title section-title--dark">
				<span class="section-title__text">
					Как мы работаем
				</span>
			</div>

			<div class="working-list uk-grid uk-grid-collapse uk-child-width-1-2@s uk-child-width-1-4@m">
				{foreach $_modx->resource.working | fromJSON as $row}
				<div class="working-item uk-cover-container">
					<img src="{$row['image']}" alt="" class="working-item__image" uk-cover>
					<div class="working-item__container">
						<div class="working-item__title">{$row['title']}</div>
						<div class="working-item__desc">
							{$row['desc'] | nl2br}
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
	</section>

	<section class="section-life">
		<div class="uk-container">
			<div class="section-title section-title--dark">
				<span class="section-title__text">
					Из жизни дизайнера
				</span>
			</div>

			<div class="uk-grid uk-grid-collapse">
				<div class="uk-width-1-2@m">
					<div class="uk-grid uk-grid-collapse">
						<div class="uk-width-1-2">
							<a href="" class="life-item">
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__title">Отзывы</span>
							</a>
							<a href="" class="life-item uk-cover-container">
								<img src="assets/template/img/life-3.jpg" alt="" class="life-item__image" uk-cover>
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__title">Вакансии</span>
							</a>
						</div>
						<div class="uk-width-1-2">
							<a href="" class="life-item uk-cover-container">
								<img src="assets/template/img/life-1.jpg" alt="" class="life-item__image" uk-cover>
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__title life-item__title--wide">Картины&nbsp;в<br> интерьер</span>
							</a>
							<a href="" class="life-item uk-cover-container">
								<img src="assets/template/img/life-4.jpg" alt="" class="life-item__image" uk-cover>
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__square uk-flex uk-flex-middle uk-flex-center">
									<span>О нас</span>
								</span>
							</a>
						</div>
					</div>
				</div>
				<div class="uk-width-1-2@m">
					<div class="uk-grid uk-grid-collapse">
						<div class="uk-width-1-2">
							<a href="" class="life-item uk-cover-container">
								<img src="assets/template/img/life-2.jpg" alt="" class="life-item__image" uk-cover>
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__desc">Дни дизайна в Китае</span>
							</a>
							<a href="" class="life-item life-item--light">
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__mc uk-flex uk-flex-column uk-flex-middle uk-flex-center">
									<span class="life-item__mc__abbr">МК</span>
									<span class="life-item__mc__text">
										Мастер-классы
										<hr>
										СТАЖИРОВКА
									</span>
								</span>
							</a>
						</div>
						<div class="uk-width-1-2">
							<a href="" class="life-item">
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<img src="assets/template/img/spacer.gif" alt="" class="life-item__spacer">
								<span class="life-item__blog">
									<span class="life-item__blog__title">Зачем нужна<br> 3D-визуализация?</span>
									<span class="life-item__blog__desc">Блог House Room Design</span>
								</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="home-text">
				<h2>{$_modx->resource.info_title}</h2>
				<h3>Что вы получаете, делая заказ в студии дизайна?</h3>
				<div class="receive-list">
					{foreach $_modx->resource.info_receive | fromJSON as $row}
					<div class="receive-item uk-flex uk-flex-middle">
						<div class="receive-item__icon"><img src="{$row['image']}'" width="102" alt=""></div>
						<div class="receive-item__text">{$row['title']}</div>
					</div>
					{/foreach}
				</div>
				<h3>Что мы учитываем в дизайне интерьера?</h3>
				<ol class="list-numbers">
					{foreach $_modx->resource.info_consider | fromJSON as $row}
						<li>{$row['title']}</li>
					{/foreach}
				</ol>
			</div>
		</div>
	</section>
{/block}