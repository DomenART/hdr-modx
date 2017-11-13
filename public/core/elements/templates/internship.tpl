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
		<div></div>
	</div>
</header>
<main class="page-main page-main--internship">
    <section class="internship-header">
        <div class="uk-container">
            <div class="internship-image">
                <img src="{$_modx->resource['image']}" alt="">
            </div>
            <div class="internship-text">
                {$_modx->resource.content}
            </div>
        </div>
    </section>
    <section class="internship-author">
        <div class="uk-container">
            <div class="section-title section-title--dark">
                <span class="section-title__text">
                    Об авторе
                </span>
            </div>
            <div class="internship-author__about">
                {$_modx->resource['internship.author']}
            </div>
        </div>
    </section>
    <section class="internship-description">
        <div class="uk-container">
            <div class="section-title section-title--dark">
                <span class="section-title__text">
                    На стажировке
                </span>
            </div>
            <div class="internship-description__text article-content">
                {$_modx->resource['internship.description']}
            </div>
        </div>
    </section>
    <section class="internship-comprasion">
        <div class="uk-container">
            <div class="internship-comprasion__title">Работы наших студентов. До и после</div>
            <ul class="uk-switcher js-internship-comprasion">
                {foreach $_modx->resource['internship.comprasion'] | fromJSON as $item}
                    <li>
                        <comprasion initial-before-image='{$item['image_before']}' initial-after-image='{$item['image_after']}'></comprasion>
                        <div class="comprasion-review">
                            <div class="comprasion-review__title">
                                {$item['title']}
                            </div>
                            <div class="comprasion-review__desc">
                                {$item['desc']}
                            </div>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <ul class="comprasion-thumbs uk-grid uk-child-width-1-2 uk-child-width-1-4@s" uk-grid uk-switcher="connect: .js-internship-comprasion">
                {foreach $_modx->resource['internship.comprasion'] | fromJSON as $item}
                <li class="comprasion-thumb">
                        <div class="comprasion-thumb__image">
                            <img src="{$item['image'] | pthumb : 'zc=1&w=300&h=130'}" alt="">
                        </div>
                        <div class="comprasion-thumb__name">
                            {$item['name']}
                        </div>
                    </li>
                {/foreach}
            </ul>
        </div>
    </section>
    <section class="internship-prices">
        <div class="uk-container">
            <div class="section-title section-title--dark ">
                <span class="section-title__text">
                    Цены
                </span>
            </div>
            <div class="uk-grid uk-grid-collapse uk-child-width-1-2@s uk-child-width-1-4@l" uk-height-match="target: .services-item__text">
                {foreach $_modx->resource['internship.pricelist'] | json_decode as $row}
                    <div class="services-item services-item--intern" style="background-image: url('{$row.image}')">
                        <div class="services-item__title services-item__title--intern">{$row.title | nl2br}</div>
                        <div class="services-item__text services-item__text--intern">{$row.desc | nl2br}</div>
                        <div class="services-item__price services-item__price--intern">
                            <span>{$row.price}</span>руб.
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </section>
    <section class="internship-enroll">
        <div class="uk-container">
            <div class="internship-form-wrapper">
                <div class="internship-enroll__title">
                    Стажировка
                </div>
                <form class="internship-form">
                    <div class="internship-form__row">
                        <label for="intern-name">Имя</label>
                        <input type="text" id="intern-name" class="uk-input" placeholder="Имя">
                    </div>
                    <div class="internship-form__row">
                        <label for="intern-tel">Телефон</label>
                        <input type="tel" id="intern-tel" class="uk-input" placeholder="+7 123 000 00 00">
                    </div>
                    <div class="internship-form__row">
                        <label for="intern-email">E-mail</label>
                        <input type="text" id="intern-email" class="uk-input" placeholder="mail@mail.com">
                    </div>
                    <button type="submit" class="btn btn-primary submit comment-send">Отправить<span uk-icon="icon: arrow-right"></span></button>
                </form>
            </div>
        </div>
    </section>
    <section class="internship-feedback">
        <div class="uk-container">
            <div class="section-title section-title--dark ">
                <span class="section-title__text">
                    Отзывы студентов
                </span>
            </div>
            <div class="feedback-item-wrapper">
                {'pdoResources' | snippet : [
                    'limit' => '2',
                    'tpl' => '@FILE chunks/items/feedback-item.tpl',
                    'includeContent' => '1'
                ]}
            </div>
        </div>
    </section>
    <section class="internship-comments">
        <div class="internship-comments-wrapper">
            {'!TicketComments' | snippet : [
                'allowGuest' => '1',
                'tplCommentFormGuest' => '@FILE chunks/forms/comment-form.tpl'
            ]}
            </div>
    </section>
</main>
{/block}
