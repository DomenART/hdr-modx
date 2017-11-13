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
        <h1 class="pagetitle pagetitle--article">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        <div></div>
    </div>
</header>
<main class="page-main">
    <div class="uk-container">
        <div class="article-promo">
            <img src="{$_modx->resource['image']}" alt="">
            {'!TicketMeta' | snippet : [
                'tpl' => '@FILE chunks/article/article-promo.tpl'
            ]}
        </div>
        <div class="article-wrapper">
            <article class="article-content uk-clearfix">
                {$_modx->resource.content}
            </article>
            <section class="article-control">
                <div class="uk-grid uk-flex-middle">
                    <div class="uk-width-1-3@m uk-flex uk-flex-middle uk-flex-around uk-flex-betwee@m">
                        <a href="{'page.blog' | config | url}" class="article-control__link"><span uk-icon="icon: arrow-left"></span>Вернуться к статьям</a>
                        {'pdoNeighbors' | snippet : [
                            'tplPrev' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-left"></span></a>',
                            'tplNext' => '@INLINE <a href="/{$uri}"><span uk-icon="icon: chevron-right"></span></a>',
                            'tplWrapper' => '@INLINE <div class="article-control__nav">{$prev}{$next}</div>'
                         ]}
                    </div>
                    {'!TicketMeta' | snippet : [
                        'tpl' => '@FILE chunks/article/article-control.tpl'
                    ]}
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
                <div class="uk-child-width-1-3@s uk-text-center uk-text-left@s" uk-grid uk-height-match="target: .readmore-item__image img" uk-height-match="target: .readmore-item__image img">
                    {'pdoResources' | snippet : [
                        'parents' => $_modx->resource.parent,
                        'limit' => 3,
                        'sortby' => 'RAND()',
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