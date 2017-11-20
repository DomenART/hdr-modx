<div class="row msearch2" id="mse2_mfilter">
	<div class="uk-container">
		<form action="{$_modx->resource.uri}" method="post" id="mse2_filters">
			<div class="portfolio__filter uk-flex uk-flex-between uk-flex-middle uk-flex-wrap">
				{$filters}
			</div>
		</form>
		{'pdoResources' | snippet : [
			'parents' => 'page.blog' | config,
			'includeTVs' => 'image,favorite',
			'tvPrefix' => '',
			'tpl' => '@FILE chunks/filter/chosen-article.tpl',
			'where' => [
				'favorite' => 1
			]
		]}
		<div id="mse2_results" class="uk-grid-large uk-child-width-1-2@m" uk-grid uk-height-match="target: .article-item img">
			{$results}
		</div>
	</div>
	<div class="paging">
		<span class="paging__inner">
			<button type="button" class="uk-button button-framed js-ms2-paging-more">Показать ещё<span class="button-arrow"></span></button>
			<button type="button" class="view-all js-ms2-paging-all">показать все</button>
		</span>
	</div>
	<div class="mse2_pagination">
		{'page.nav' | placeholder}
	</div>
</div>
