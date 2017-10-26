<div>
    <div uk-grid>
        <div class="uk-width-1-3">
            <img src="{$image}" alt="">
        </div>
        <div class="uk-width-2-3">
            <div>
                <time>{$publishedon | date_format: "%d.%m.%y"}</time>
                {$parent | resource : 'pagetitle'}
            </div>
            <div>
                <a href="{$uri}">
                    {$pagetitle}
                </a>
            </div>
            <div>
                {$introtext}
            </div>
        </div>
    </div>
</div>