{extends 'file:templates/master.tpl'}

{block 'content'}
<header class="page-header">
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
<main class="page-main">
	<div class="uk-container">
		<div class="js-calendar" data-events='{"eventsArray" | snippet}' data-date='{$.get["date"]}'></div>
	    {'pdoResources' | snippet : [
	        'tpl' => '@FILE chunks/items/masterclass.tpl',
	        'limit' => 0,
	        'includeTVs' => 'price,date,duration,places,image',
	        'tvPrefix' => '',
			'sortby' => '{ "date":"DESC" }',
			'where' => $.get['date'] ? ['date' => $.get['date']] : []
	    ]}
    </div>
</main>
{/block}