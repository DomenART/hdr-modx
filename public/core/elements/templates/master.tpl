<!doctype html>
<html class="page" lang="en">
<head>
	{include 'file:partials/head.tpl'}
</head>
<body>
	<div class="wrapper">
		{include 'file:partials/toolbar.tpl'}

		{include 'file:partials/header.tpl'}
		
		{block 'substrate'}
			<div class="header-substrate js-toolbar-intro"></div>
		{/block}

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
					<div class="article-content uk-margin-large">
						{$_modx->resource.content}
					</div>
					<div></div>			
				</div>
			</main>
		{/block}

		{include 'file:partials/footer.tpl'}
	</div>

	<script src="assets/template/main.js?v={rand()}"></script>
</body>
</html>