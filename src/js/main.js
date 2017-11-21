/* import files */
require.context('../img', true)
require.context('../fonts', true)

/* import styles */
import '../scss/main.scss'

/*--------------------------------------------------*/

/**
 * Include React
 */

import React from 'react'
import ReactDOM from 'react-dom'
import Comparison from './components/comparison'
import ComparisonHome from './components/comparison-home'
import Calendar from './components/calendar'

renderReactComponents(document)

function renderReactComponents(container) {
    container.querySelectorAll('.js-comparison').forEach((el, i) => {
        let data = el.dataset
        let before = {
            image: data.beforeimage,
            label: data.beforelabel || ''
        }
        let after = {
            image: data.afterimage,
            label: data.afterlabel || ''
        }

        ReactDOM.render(
            <Comparison before={before} after={after} />,
            el
        )
    })

    container.querySelectorAll('.js-comparison-home').forEach((el, i) => {
        let data = el.dataset
        let images = JSON.parse(data.images)

        images = images.map((item) => ({
            id: item.MIGX_id,
            label: item.name,
            image: item.image,
            url: item.url
        }))

        ReactDOM.render(
            <ComparisonHome images={images} />,
            el
        )
    })

    container.querySelectorAll('.js-calendar').forEach((el, i) => {
        let events = el.dataset.events ? JSON.parse(el.dataset.events) : []
        let date = el.dataset.date || ''

        ReactDOM.render(
            <Calendar events={events} date={date} />,
            el
        )
    })
}


/**
 * Include jQuery
 */
import jQuery from 'jquery'

/**
 * Include UIkit
 */
import UIkit from 'uikit'
import Icons from 'uikit/dist/js/uikit-icons'
UIkit.use(Icons)

/**
 * validate
 */
require('jquery-validation')
require('jquery-validation/dist/localization/messages_ru.js')
$('.ajax_form').each(function () {
	$(this).validate({
		errorClass: 'uk-form-danger',
		validClass: 'uk-form-success'
	});
});
$(document).on('af_complete', function (event, response) {
	response.form.addClass('af_completed');
});

/**
 * toolbar
 */
var toolbar = document.querySelector('.toolbar')
if (toolbar) {
	let intro = document.querySelector('.js-toolbar-intro')

	window.addEventListener('scroll', (e) => {
		if (window.scrollY + toolbar.offsetHeight + toolbar.offsetTop <= intro.offsetHeight + intro.offsetTop + 5)
			toolbar.classList.add('toolbar--transparent')
		else
			toolbar.classList.remove('toolbar--transparent')
	})
}

/**
 * scrolltop
 */
window.addEventListener('scroll', (e) => {
    let button = document.querySelector('.scrolltop')

    if (window.scrollY > 300)
        button.classList.add('scrolltop--visible')
    else
        button.classList.remove('scrolltop--visible')
})

/**
 * sticky slide bar
 */
var slideBar = document.getElementById('slide-bar')
if(slideBar) {
	let slideshow = document.getElementById('slideshow')

	window.addEventListener('scroll', (e) => {
		if(window.scrollY > slideshow.offsetHeight - window.innerHeight)
			slideBar.classList.add('slide-bar--sticky')
		else
			slideBar.classList.remove('slide-bar--sticky')
	})
}

/**
 * sticky social links
 */
if(window.innerWidth > 960) {
	let slideBarSocial = document.querySelector('.slide-bar__social')
	let toolBarSocial = document.querySelector('.toolbar__social')

	if(slideBarSocial) {
		let slideBarSocialTop = slideBarSocial.getBoundingClientRect().top

		window.addEventListener('scroll', (e) => {
			if(window.scrollY > slideBarSocialTop)
				toolBarSocial.classList.add('toolbar__social--visible')
			else
				toolBarSocial.classList.remove('toolbar__social--visible')
		})
	} else if(toolBarSocial) {
		toolBarSocial.classList.add('toolbar__social--visible')
	}
}

/**
 * Split projects into two columns
 */
var projectItems = document.querySelectorAll('.js-project-item')
if (projectItems.length) {
	let leftCol = document.getElementById('project-pool-left')
	let rightCol = document.getElementById('project-pool-right')
	let leftHeight = 0
	let rightHeight = 0

	for (let i = 1; i < projectItems.length; i++) {
		let item = projectItems[i]

		if (leftHeight < rightHeight) {
			leftHeight += item.offsetHeight
		} else {
			leftCol.removeChild(item)
			rightCol.appendChild(item)
			rightHeight += item.offsetHeight
		}
	}
}

/**
 * height-match для пакетов страницы "Цены"
 */
function dependentMatch(wrapper, targets) {
	let wrap = document.querySelector(wrapper)
	if (wrap) {
		let cur = 0
		let process = false
		let heightMatch = {}
		let step = function (target) {
			if (heightMatch._isReady && process) {
				cur++
				process = false
				heightMatch.$destroy()
			} else if (!process) {
				process = true
				heightMatch = UIkit.heightMatch(wrap, {
					target: targets[cur]
				})
			}
			if (cur <= targets.length) requestAnimationFrame(step)
		}
		requestAnimationFrame(step)
	}
}
dependentMatch('.js-packages-wrapper', ['.packages-item__title', '.packages-item__desc', '.packages-item__text'])

/**
 * update the index of the active slide
 */
var slideshow = document.getElementById('slideshow')
if(slideshow) {
	UIkit.util.on(slideshow, 'itemshow', function (el, slideshow) {
		slideshow.$el.querySelector('.js-slideshow-index').innerHTML = slideshow.index + 1
	})
}

/**
 * pagination on page
 */
var pagingMore = document.querySelector('.js-paging-more')
var pagingAll = document.querySelector('.js-paging-all')

if (pagingMore && pagingAll) {
    const key = 'page'

	pagingMore.addEventListener('click', () => {
		pdoPage.addPage(pdoPage.configs[key])
	})

	pagingAll.addEventListener('click', () => {
        pdoPage.callbacks['after'] = function(config, response) {
            document.querySelector(pdoPage.configs[key]['wrapper']).style.opacity = 1

            if(response.page < response.pages) {
                pdoPage.addPage(pdoPage.configs[key])
            }
        }
        pdoPage.addPage(pdoPage.configs[key])
    })

	// hide the pagination section
	$(document).on('pdopage_load', (e, config, response) => {
		let section = document.querySelector(config.wrapper + ' .paging')
		section.style.display = response.pages === response.page ? 'none' : 'block'
        renderReactComponents(document.querySelector(config['wrapper']))
	})
}

/**
 * ms2 pagination on page
 */
var ms2PagingMore = document.querySelector('.js-ms2-paging-more')
var ms2PagingAll = document.querySelector('.js-ms2-paging-all')

if (ms2PagingMore && ms2PagingAll) {
	ms2PagingMore.addEventListener('click', () => {
		mSearch2.addPage()
	})

	ms2PagingAll.addEventListener('click', () => {
		mSearch2.load({
			page: 1,
			limit: 9999 // bad
		})
	})

	// hide the pagination section
	$(document).on('mse2_load', (e, response) => {
		let section = document.querySelector('#mse2_mfilter .paging')
		section.style.display = response.data.pages === response.data.page ? 'none' : 'block'
	})
}

/**
 * Responsive tables in article
 */
var article = document.querySelector('.article-content')

if (article) {
	let div = document.createElement('div')
	let tables = article.querySelectorAll('table')

	tables.forEach(function(element) {
		element.parentNode.insertBefore(div, element)
		div.appendChild(element)
		div.classList.add("article-table-wrapper","uk-overflow-auto")
	})
}

/**
 * Likes in article
 */
$('.js-like').click(function () {
	let $el = $(this)
	let id = $(this).data('id')
	let value = $(this).data('value')

	$.post('assets/template/action.php', {
		action: "ticket/like",
		id: id,
		value: value
	}, function (response) {
		response = JSON.parse(response)

		if (response.success) {
			$el.text(response.rating[value > 0 ? 'rating_plus' : 'rating_minus'])
		} else {
			UIkit.notification({
				message: response.message,
				status: 'danger',
				timeout: 5000
			})
		}
	})
})