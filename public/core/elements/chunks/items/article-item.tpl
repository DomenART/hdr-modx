<div>
    <article class="article-item" uk-grid>
        <div class="uk-width-2-5@s">
            <div class="article-item__image">
                <a href="{$uri}">
                  <img src="{$image}" alt="">
                </a>
            </div>
        </div>
        <div class="uk-width-3-5@s">
            <div>
                <time class="article-item__date">{$publishedon | date_format: "%d.%m.%y"}</time>
                <span class="article-item__category">{$parent | resource : 'pagetitle'}</span>
            </div>
            <div>
                <a href="{$uri}" class="article-item__title">
                    {$pagetitle}
                </a>
            </div>
            <div class="article-item__intro">
                {$introtext}
            </div>
        </div>
    </article>
</div>