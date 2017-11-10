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
		<calendar initial-events='{"eventsArray" | snippet}' initial-date="{$.get['date']}"></calendar>
        {'msProducts' | snippet : [
            'tpl' => '@FILE chunks/items/masterclass.tpl',
            'limit' => 0,
			'sortby' => '{ "date":"DESC" }',
			'optionFilters' => $.get['date'] ? '{ "date":"' ~ $.get['date'] ~ '" }' : '',
			'sortbyOptions' => 'date:date'
        ]}
    </div>
</main>
{/block}