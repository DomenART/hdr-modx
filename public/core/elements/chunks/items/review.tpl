<article class="article-item" uk-grid>
    <div class="uk-width-2-5@s">
        <div class="article-item__image uk-cover-container">
            <img src="{$image}" class="uk-cover" alt="">
        </div>
    </div>
    <div class="uk-width-3-5@s">
        <div class="article-item__title">
            <time class="article-item__date">{$publishedon | date_format: "%d.%m.%y"}</time> {$pagetitle}
        </div>
        <div class="article-item__intro">
            {$introtext}
        </div>
    </div>
</article>