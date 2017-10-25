<div class="row msearch2" id="mse2_mfilter">
	<form action="[[~[[*id]]]]" method="post" id="mse2_filters">
	    <div class="portfolio__filter uk-flex uk-flex-between uk-flex-middle uk-flex-wrap">
		    [[+filters]]
		</div>
	</form>

		<div id="mse2_results" class="uk-grid uk-grid-collapse uk-child-width-1-2@m">
			[[+results]]
		</div>
		<div class="mse2_pagination">
			[[!+page.nav]]
		</div>

</div>
