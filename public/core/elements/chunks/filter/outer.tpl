<div class="row msearch2" id="mse2_mfilter">
	<form action="[[~[[*id]]]]" method="post" id="mse2_filters">
	    <div class="portfolio__filter uk-flex uk-flex-between uk-flex-middle uk-flex-wrap">
		    [[+filters]]
		</div>
	</form>

	<div id="mse2_results" class="uk-grid uk-grid-collapse uk-child-width-1-2@m">
		[[+results]]
	</div>

	<div class="paging">
		<span class="paging__inner">
			<button type="button" class="uk-button button-framed js-paging-more">Показать ещё<span class="button-arrow"></span></button>
			<button type="button" class="view-all js-paging-all">показать все</button>
		</span>
	</div>

	<div class="mse2_pagination">
		[[!+page.nav]]
	</div>
</div>