{extends 'file:templates/master.tpl'}
{block 'content'}
<header class="article-header">
    <div class="header-substrate"></div>
    <div class="uk-container">
    	<div class="breadcrumb uk-flex uk-flex-center">
    	    {'pdoCrumbs' | snippet : [
    	        'showHome' => '1',
    	        'tplWrapper' => '@INLINE <ul class="uk-breadcrumb">{$output}</ul>'
    	    ]}
    	</div>
        <h1 class="pagetitle pagetitle--article">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        <div></div>
    </div>
</header>
<main class="article-main">
    <div class="uk-container">
        <div class="article-promo">
            <img src="{$_modx->resource['image']}" alt="">
            <div class="article-promo__info uk-grid uk-grid-collapse uk-child-width-1-2@s uk-flex-middle">
                <div class="uk-flex uk-flex-middle">
                    <time class="article-promo__date">{$publishedon | date_format : '%d.%m.%y'}</time>
                    <a href="{$_modx->resource.parent | url}" class="article-promo__section">{$_modx->resource.parent | resource: 'pagetitle'}</a>
                </div>
                <div class="uk-flex uk-flex-middle uk-flex-between uk-flex-wrap">
                    <a href="" class="article-promo__like">147</a>
                    <a href="" class="article-promo__comment">12</a>
                    <a href="" class="article-promo__view">122345</a>
                        {'pdoNeighbors' | snippet : [
                            'tplPrev' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-left"></span></a>',
                            'tplNext' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-right"></span></a>',
                            'tplWrapper' => '@INLINE <div class="article-promo__nav">{$prev}{$next}</div>'
                        ]}
                </div>
            </div>
        </div>
        <div class="article-wrapper">
            <article class="article-content uk-clearfix">
                {$_modx->resource.content}
            </article>
            <section class="article-control">
                <div class="uk-grid uk-flex-middle">
                    <div class="uk-width-1-3@m uk-flex uk-flex-middle uk-flex-around uk-flex-betwee@m">
                        <a href="#" class="article-control__link"><span uk-icon="icon: arrow-left"></span>Вернуться к статьям</a>
                        {'pdoNeighbors' | snippet : [
                            'tplPrev' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-left"></span></a>',
                            'tplNext' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-right"></span></a>',
                            'tplWrapper' => '@INLINE <div class="article-control__nav">{$prev}{$next}</div>'
                         ]}
                    </div>
                    <div class="uk-width-1-3@m uk-flex uk-flex-middle uk-flex-around uk-flex-betwee@m">
                        <a href="#" class="article-promo__like">147</a>
                        <a href="#" class="article-promo__comment">12</a>
                        <a href="#" class="article-promo__view">122345</a>
                    </div>
                    <div class="uk-width-1-3@m uk-text-center uk-text-right@m">
                        <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
                        <script src="//yastatic.net/share2/share.js"></script>
                        <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter"></div>
                    </div>
                </div>
            </section>
            <section class="article-readmore">
                <div class="article-readmore__header">
                    Похожие статьи
                </div>
                <div class="uk-child-width-1-3@s uk-text-center uk-text-left@s" uk-grid>
                    {'pdoResources' | snippet : [
                        'parents' => 14,
                        'limit' => 3,
                        'sortby' => RAND(),
                        'tpl' => '@FILE chunks/items/readmore-item.tpl',
                        'includeTVs' => 'image',
                        'tvPrefix' => '',
                        'resources' => '-' ~ $_modx->resource.id
                    ]}
                </div>
            </section>
            <section class="article-comments">
                {'!TicketComments' | snippet : [
                    'allowGuest' => '1',
                    'tplCommentFormGuest' => '@FILE chunks/forms/comment-form.tpl'
                ]}
            </section>
        </div>
    </div>
</main>
{/block}
