<div class="article-promo__info uk-grid uk-grid-collapse uk-child-width-1-2@s uk-flex-middle">
    <div class="uk-flex uk-flex-middle">
        <time class="article-promo__date">{$publishedon | date_format : '%d.%m.%y'}</time>
        <span class="article-promo__section">{$_modx->resource.parent | resource: 'pagetitle'}</span>
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