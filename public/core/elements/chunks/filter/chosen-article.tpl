<article class="chosen-article">
    <div class="uk-grid uk-child-width-1-2@s">
        <div>
            <div class="chosen-article__image">
                <a href="{$uri}">
                    <img src="{$image}" alt="">
                </a>
            </div>
        </div>
        <div>
            <div class="chosen-article__description">
                <div>
                    <time class="chosen-article__date">{$publishedon | date_format: "%d.%m.%y"}</time>
                    <span class="chosen-article__category">{$parent | resource : 'pagetitle'}</span>
                </div>
                <div>
                    <a href="{$uri}" class="chosen-article__title">
                        <span>{$pagetitle}</span>
                    </a>
                </div>
                <div class="uk-text-right">
                    <a href="{$uri}" class="chosen-article__more">
                        Читать больше
                    </a>
                </div>
            </div>
        </div>
    </div>
</article>