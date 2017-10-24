 <div>
    <article class="readmore-item">
        <div class="readmore-item__image">
            <a href="{$uri}">
                <img src="{$image}" alt="">
            </a>
        </div>
        <div class="readmore-item__date">
            <time>{$publishedon | date_format: "%d.%m.%y"}</time>
        </div>
        <div class="readmore-item__title">
            <a href="{$uri}">
                {$pagetitle}
            </a>
        </div>
    </article>
</div>