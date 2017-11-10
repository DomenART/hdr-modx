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
<div class="portfolio-pool">
	{'!mFilter2' | snippet : [
		'parents' => $_modx->resource.id,
		'limit' => 4,
		'ajaxMode' => 'button',
		'ajaxTplMore' => '@INLINE <div class="portfolio-pool__control uk-flex uk-flex-around uk-flex-center@s uk-flex-middle uk-flex-wrap"><button type="button" class="uk-button button-intro button-intro--portfolio js-portfolio-more">Показать ещё<span class="button-intro__arrow"></span></button><button type="button" class="view-all view-all--portfolio js-portfolio-more-all">показать все</button></div>',
		'paginator' => 'pdoPage@portfolioPaginator',
		'tplOuter' => '@FILE chunks/filter/outer-portfolio.tpl',
		'tpls' => '@FILE chunks/items/portfolio-item.tpl',
		'filters' => 'publishedon:year,parent:categories',
		'suggestionsRadio' => 'resource|publishedon,resource|parent',
		'includeTVs' => 'image',
		'tplFilter.outer.resource|publishedon' => '@FILE chunks/filter/radio.tpl',
		'tplFilter.row.resource|publishedon' => '@FILE chunks/filter/input.tpl',
		'tplFilter.outer.tv|category' => '@FILE chunks/filter/select.tpl',
		'tplFilter.row.tv|category' => '@FILE chunks/filter/option.tpl',
		'where' => ['class_key' => 'Ticket']
	]}
</div>
{/block}
