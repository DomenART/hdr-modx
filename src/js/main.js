/* import files */
require.context('../img', true)
require.context('../fonts', true)

/* import styles */
import '../less/main.less'

/*--------------------------------------------------*/

/**
 * Include Vue
 */
import Vue from 'vue'
import comprasion from './components/comprasion.vue'

var app = new Vue({
	el: '#app',
	components: {
		comprasion
	}
})

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

/* height-match для пакетов страницы "Цены" */

var packagesText = document.querySelectorAll(".packages-item__text");
var packagesTitle = document.querySelectorAll(".packages-item__title");
var packagesDesc = document.querySelectorAll(".packages-item__desc");

function heightMatch(packagesItem) {
	if (packagesItem) {
		var packagesItemMax = 0;
		for (var i = 0; i < packagesItem.length; i++) {
			if (packagesItemMax < packagesItem[i].offsetHeight) {
				packagesItemMax = packagesItem[i].offsetHeight
			}
		}
		for (var i = 0; i < packagesItem.length; i++) {
			packagesItem[i].style.height = packagesItemMax + "px";
		}
	}
}

heightMatch(packagesText);
heightMatch(packagesTitle);
heightMatch(packagesDesc);

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
	pagingMore.addEventListener('click', () => {
		mSearch2.addPage()
	})

	pagingAll.addEventListener('click', () => {
		mSearch2.load({
			page: 1,
			limit: 9999 // bad
		})
	})
	
	// hide the pagination section
	$(document).on('mse2_load', (e, response) => {
		let section = document.querySelector('#mse2_mfilter .paging')
		section.style.display = response.data.pages == response.data.page ? 'none' : 'block'
	})
}

/* Responsive tables in article */

var article = document.querySelector('.article-content')

if (article) {
	let div = document.createElement('div')
	let tables = article.querySelectorAll('table')

	tables.forEach(function(element) {
		element.parentNode.insertBefore(div, element)
		div.appendChild(element);
		div.classList.add("article-table-wrapper","uk-overflow-auto")
	});
}