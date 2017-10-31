{extends 'file:templates/master.tpl'}
{block 'content'}
<header class="header-beige">
	<div class="header-substrate"></div>
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
<div class="blog-pool">
	{'!mFilter2' | snippet : [
		'parents' => $_modx->resource.id,
		'limit' => 4,
		'ajaxMode' => 'button',
		'tplOuter' => '@FILE chunks/filter/outer-blog.tpl',
		'tpls' => '@FILE chunks/items/article-item.tpl',
		'filters' => 'publishedon:year,parent:categories',
		'suggestionsRadio' => 'resource|publishedon,resource|parent',
		'includeTVs' => 'image,chosen',
		'tplFilter.outer.resource|publishedon' => '@FILE chunks/filter/radio.tpl',
		'tplFilter.row.resource|publishedon' => '@FILE chunks/filter/input.tpl',
		'tplFilter.outer.resource|parent' => '@FILE chunks/filter/select.tpl',
		'tplFilter.row.resource|parent' => '@FILE chunks/filter/option.tpl',
		'where' => ['class_key' => 'Ticket']
	]}
</div>
{/block}