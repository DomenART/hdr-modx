{extends 'file:templates/master.tpl'}
{block 'content'}
    <header>
        <div class="header-substrate"></div>
        <div class="uk-container">
            <div class="breadcrumb uk-flex uk-flex-center">
                {'pdoCrumbs' | snippet : [
                    'showHome' => '1',
                    'tplWrapper' => '@INLINE <ul class="uk-breadcrumb">{$output}</ul>'
                ]}
            </div>
            <h1 class="pagetitle">Статьи</h1>
            <div></div>
        </div>
    </header>
    <main class="articles-content">
        <div class="uk-container">
            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-child-width-1-4@l uk-text-center uk-text-left@s" uk-grid>
                {'pdoResources' | snippet : [
                    'tpl' => '@FILE chunks/items/readmore-item.tpl',
                    'includeTVs' => 'image',
                    'tvPrefix' => ''
                ]} 
            </div>
        </div>
    </main>
{/block}