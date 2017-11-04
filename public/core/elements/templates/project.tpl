{extends 'file:templates/master.tpl'}

{block 'substrate'}{/block}

{block 'content'}
<header class="project-header uk-flex uk-flex-column uk-flex-between uk-flex-middle" style="background: url('{$_modx->resource['image']}') no-repeat 50% 50%; background-size: cover">
	<div class="breadcrumb breadcrumb--white uk-flex uk-flex-center">
		{'pdoCrumbs' | snippet : [
			'showHome' => '1',
			'tplWrapper' => '@INLINE <ul class="uk-breadcrumb uk-flex-center">{$output}</ul>',
			'where' => [
				'class_key:!=' => 'TicketsSection'
			]
		]}
	</div>

	<h1 class="pagetitle pagetitle--white pagetitle--project">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
	
	<div class="project-bar uk-flex uk-flex-middle">
		{'pdoNeighbors' | snippet : [
			'tplPrev' => '@INLINE <a href="{$uri}" class="project-bar__links uk-flex uk-flex-center uk-flex-column"><img src="assets/template/img/project-arr-left.svg" alt=""><span>предыдущий</span></a>',
			'tplNext' => '@INLINE <a href="{$uri}" class="project-bar__links uk-flex uk-flex-center uk-flex-column"><img src="assets/template/img/project-arr-right.svg" alt=""><span>следующий</span></a>',
			'tplWrapper' => '@INLINE <div class="project-bar__control uk-flex uk-flex-between">{$prev}{$next}</div>'
		]}
		<div class="project-bar__info uk-flex uk-flex-middle">
			<div class="project-bar__year">
				{$publishedon | date_format : '%Y'}
			</div>
			<div class="project-bar__desc">
				{$_modx->resource.introtext | nl2br }
			</div>
		</div>
	</div>
</header>
<main>
	<div class="uk-container">
		<div class="project__category">
			{$_modx->resource.parent |  resource: 'pagetitle'}
		</div>
		<div class="project__text">
			{$_modx->resource.content}
		</div>
	</div>
	<div class="project-pool">
		<div class="uk-grid uk-grid-collapse uk-child-width-1-2@s uk-flex uk-flex-bottom">
			<div id="project-pool-left">
				{foreach $_modx->resource['project.album'] | json_decode as $row}
				<div class="project-item js-project-item">
					<img src="{$row.image}" alt="">
					{if $row['text']}
						<div class="project-item__text">{$row.text | nl2br}</div>
					{/if}
					{if $row['consult']}
						<div class="project-consult">
							{include 'file:partials/consult.tpl'}
						</div>
					{/if}
				</div>
				{/foreach}
			</div>
			<div id="project-pool-right"></div>
		</div>
	</div>
</main>
{/block}
