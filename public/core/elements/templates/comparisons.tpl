{extends 'file:templates/master.tpl'}

{block 'content'}
<header class="page-header">
    <div class="uk-container">
        <div class="breadcrumb uk-flex uk-flex-center">
            {'pdoCrumbs' | snippet : [ 'showHome' => '1', 'tplWrapper' => '@INLINE
            <ul class="uk-breadcrumb">{$output}</ul>' ]}
        </div>
        <h1 class="pagetitle">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
        {if $_modx->resource.content?}
            <div class="page-header__text">{$_modx->resource.content}</div>
        {/if}
        <div></div>
    </div>
</header>
<main class="page-main page-main--comparisons" id="pdopage">
    <div class="rows uk-container">
        {'!pdoPage' | snippet : [
            'includeTVs' => 'image_after,image_before',
            'tvPrefix' => '',
            'ajaxMode' => 'button',
            'limit' => 1,
            'tpl' => '@FILE chunks/items/comparison.tpl'
        ]}
    </div>
    {'page.nav' | placeholder}
    <div class="paging">
        <span class="paging__inner">
            <button type="button" class="uk-button button-framed js-paging-more">Показать ещё<span class="button-arrow"></span></button>
            <button type="button" class="view-all js-paging-all">показать все</button>
        </span>
    </div>
</main>
{/block}