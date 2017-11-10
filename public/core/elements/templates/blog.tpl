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
<div class="blog-pool">
	{'!mFilter2' | snippet : [
		'parents' => $_modx->resource.id,
		'limit' => 8,
		'ajaxMode' => 'button',
		'tplOuter' => '@FILE chunks/filter/outer-blog.tpl',
		'tpls' => '@FILE chunks/items/article-item.tpl',
		'filters' => 'publishedon:year,tv|category:default',
		'suggestionsRadio' => 'resource|publishedon,tv|category',
		'includeTVs' => 'image,chosen',
		'tplFilter.outer.resource|publishedon' => '@FILE chunks/filter/radio.tpl',
		'tplFilter.row.resource|publishedon' => '@FILE chunks/filter/input.tpl',
		'tplFilter.outer.tv|category' => '@FILE chunks/filter/category-select.tpl',
		'tplFilter.row.tv|category' => '@FILE chunks/filter/category-option.tpl',
		'where' => ['class_key' => 'Ticket']
	]}
</div>
{/block}