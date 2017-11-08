{extends 'file:templates/master.tpl'}

{block 'content'}
<header class="header-beige">
	<div class="uk-container">
		<div class="breadcrumb uk-flex uk-flex-center">
			{'pdoCrumbs' | snippet : [
			'showHome' => '1',
			'tplWrapper' => '@INLINE <ul class="uk-breadcrumb">{$output}</ul>'
			]}
		</div>
		<h1 class="pagetitle">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
		<div></div>
	</div>
</header>
<main class="masterclass-background">
    <div class="uk-container">
        <pre>
        {'msProducts' | snippet : [
            'tpl' => '@FILE chunks/items/masterclass1.tpl',
            'limit' => 2,
            'showLog' => true,
        ]}
        </pre>
    </div>
</main>
{/block}
    