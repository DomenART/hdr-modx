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
<main class="page-main page-main--contacts">
	<div class="uk-container">
		<div class="contacts">
			<div class="contacts-head">
				<img class="contacts-head__image" src="{$_modx->resource['image']}">
				<address class="contacts-info">
					<div class="uk-grid uk-grid-collapse uk-child-width-1-2@s">
						<div>
							<div class="contacts-info__col">
								{foreach $_modx->resource['contacts.info'] | json_decode as $row}
									<div class="contacts-info__row">
										{$row.text}
									</div>
								{/foreach}
							</div>
						</div>
						<div>
							<div class="contacts-info__col">
								{foreach $_modx->resource['contacts.social'] | json_decode as $row}
									<div class="contacts-info__row">
										<a href="{$row.link}">{$row.text}</a>
									</div>
								{/foreach}
							</div>
						</div>
					</div>
				</address>
			</div>
			{'!AjaxForm@Form' | snippet : [
	            'emailSubject'  => 'Сообщение',
	            'validate'      => 'nomail:blank,email:email:required',
	            'form'          => '@FILE chunks/forms/contacts-form.tpl'
	        ]}
		</div>
	</div>
</main>
{/block}