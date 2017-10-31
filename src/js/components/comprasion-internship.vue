<template>
	<div>
		<header class="comprasion__header uk-flex uk-flex-between uk-flex-middle">
			<div class="comprasion__title">Работы наших студентов. До и после</div>
		</header>

		<div class="comprasion__arrows">
			<span></span>
			<span></span>
		</div>

		<figure class="comprasion" :style="{width: width + 'px', height: height + 'px'}">
			<div class="comprasion__main" :style="{backgroundImage:'url(' + before + ')'}">
				<div class="comprasion__main__mask"></div>
			</div>

			<div class="comprasion__second" :style="{backgroundImage:'url(' + after + ')'}">
				<div class="comprasion__second__mask"></div>
			</div>

			<span class="comprasion__label comprasion__label--main" v-show="!hideMainLabel">было</span>

			<span class="comprasion__label comprasion__label--second" v-show="!hideSecondLabel">стало</span>

			<span class="comprasion__handle" @mousedown="down"></span>
		</figure>
	</div>
</template>

<script>
	import Velocity from 'velocity-animate'

	module.exports = {
		props: ['initialBefore', 'initialAfter'],

		data () {
			return {
				before: this.initialBefore,
				after: this.initialAfter,
				hideMainLabel: false,
				hideSecondLabel: false,
				baseWidth: 1200,
				baseHeight: 460,
				width: 1200,
				height: 460
			}
		},

		mounted () {
			this.resize()
			window.addEventListener('resize', this.resize)
		},

		computed: {
			container () {
				return this.$el.querySelector('.comprasion')
			},

			mainImage () {
				return this.container.querySelector('.comprasion__main')
			},

			mainImageMask () {
				return this.container.querySelector('.comprasion__main__mask')
			},

			secondImage () {
				return this.container.querySelector('.comprasion__second')
			},

			secondImageMask () {
				return this.container.querySelector('.comprasion__second__mask')
			},

			mainLabel () {
				return this.container.querySelector('.comprasion__label--main')
			},

			secondLabel () {
				return this.container.querySelector('.comprasion__label--second')
			},

			mainLabelWidth () {
				return this.mainLabel.offsetWidth
			},

			secondLabelWidth () {
				return this.secondLabel.offsetWidth
			},

			handle () {
				return this.container.querySelector('.comprasion__handle')
			}
		},

		methods: {
			updateClip (coords) {
				coords = coords || this.clipCoords()

				this.secondImage.style.clip = "rect(0, " + coords.x + "px, " + coords.y + "px, 0)"
				this.hideMainLabel = coords.x > this.container.offsetWidth - this.mainLabelWidth
				this.hideSecondLabel = this.secondLabelWidth > coords.x
			},

			down () {
	      		document.addEventListener('mousemove', this.move)
      			document.addEventListener('mouseup', this.up)
			},

			up () {
      			document.removeEventListener('mousemove', this.move)
      			document.removeEventListener('mouseup', this.up)
			},

			move (e) {
				let left = e.clientX - this.container.offsetLeft

				if(left < 0) left = 0
				if(left > this.container.offsetWidth) left = this.container.offsetWidth

				this.handle.style.left = left + 'px'

				this.updateClip({
					x: left,
					y: this.height
				})
			},

			clipCoords () {
				let left = this.handle.getBoundingClientRect().left - this.container.getBoundingClientRect().left

				return {
					x: left + (this.handle.offsetWidth / 2),
					y: this.height
				}
			},

			reset () {
				this.handle.style.left = ''
				this.updateClip()
			},

			resize () {
				console.log(this.container)
				this.height = this.container.offsetWidth / this.baseWidth * this.baseHeight
				this.reset()
			}
		}
	}
</script>
