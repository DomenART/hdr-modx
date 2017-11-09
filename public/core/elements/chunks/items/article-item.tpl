<div>
    <article class="article-item" uk-grid>
        <div class="uk-width-2-5@s">
            <a href="{$uri}" class="article-item__image uk-cover-container">
                <img src="{$image}" class="uk-cover" alt="">
            </a>
        </div>
        <div class="uk-width-3-5@s">
            <div class="article-item__info">
                <time class="article-item__date">{$publishedon | date_format: "%d.%m.%y"}</time>
                <span class="article-item__category">{$parent | resource : 'pagetitle'}</span>
            </div>
            <a href="{$uri}" class="article-item__title">
                {$pagetitle}
            </a>
            <div class="article-item__intro">
                {$introtext}
            </div>
        </div>
    </article>
</div>