{extends 'file:templates/master.tpl'} {block 'content'}
<header class="page-header">
    <div class="uk-container">
        <div class="breadcrumb uk-flex uk-flex-center">
            {'pdoCrumbs' | snippet : [ 'showHome' => '1', 'tplWrapper' => '@INLINE
            <ul class="uk-breadcrumb">{$output}</ul>' ]}
        </div>
        <h1 class="pagetitle">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        <div></div>
    </div>
</header>
<main class="page-main section-comprasion">
    <div class="uk-container" id="pdopage">
        <div class="rows">
            {'!pdoPage' | snippet : [
                'includeTVs' => 'image_after,image_before',
                'tvPrefix' => '',
                'ajaxMode' => 'button',
                'limit' => 2,
                'tpl' => '@FILE chunks/items/comparsion.tpl'
            ]}
        </div>
        {'page.nav' | placeholder}
        <div class="paging">
            <span class="paging__inner">
                <button type="button" class="uk-button button-framed js-paging-more">Показать ещё<span class="button-arrow"></span></button>
                <button type="button" class="view-all js-paging-all">показать все</button>
            </span>
        </div>
    </div>
</main>
{/block}