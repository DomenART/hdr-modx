<template>
	<div>
		<div class="comprasion__arrows">
			<span></span>
			<span></span>
		</div>
		<figure class="comprasion" :style="{width: width + 'px', height: height + 'px'}">
			<div class="comprasion__before" :style="{backgroundImage:'url(' + before.image + ')'}">
				<div class="comprasion__before__mask"></div>
			</div>

			<div class="comprasion__after" :style="{backgroundImage:'url(' + after.image + ')'}">
				<div class="comprasion__after__mask"></div>
			</div>

			<span class="comprasion__label comprasion__label--before" v-show="!hideBeforeLabel">{{ before.label }}</span>

			<span class="comprasion__label comprasion__label--after" v-show="!hideAfterLabel">{{ after.label }}</span>

			<span class="comprasion__handle" @mousedown="down"></span>
		</figure>
	</div>
</template>

<script>
	module.exports = {
		props: ['initialBeforeImage', 'initialAfterImage', 'initialBeforeLabel', 'initialAfterLabel'],

		data () {
			return {
				hideBeforeLabel: false,
				hideAfterLabel: false,
				baseWidth: 1200,
				baseHeight: 460,
				width: 1200,
				height: 460,
        switcher: null
			}
		},

		mounted () {
      if(this.switcher = this.getParentSwitcher(this.$el)) {
      	this.switcher.addEventListener('shown', () => {
          this.resize()
      	})
      }

			this.resize()
			window.addEventListener('resize', this.resize)
		},

		computed: {
			before () {
				return {
          image: this.initialBeforeImage,
          label: this.initialBeforeLabel || 'было'
        }
			},

			after () {
				return {
          image: this.initialAfterImage,
          label: this.initialAfterLabel || 'стало'
        }
			},

			container () {
				return this.$el.querySelector('.comprasion')
			},

			beforeImage () {
				return this.container.querySelector('.comprasion__before')
			},

			beforeImageMask () {
				return this.container.querySelector('.comprasion__before__mask')
			},

			afterImage () {
				return this.container.querySelector('.comprasion__after')
			},

			afterImageMask () {
				return this.container.querySelector('.comprasion__after__mask')
			},

			beforeLabel () {
				return this.container.querySelector('.comprasion__label--before')
			},

			afterLabel () {
				return this.container.querySelector('.comprasion__label--after')
			},

			beforeLabelWidth () {
				return this.beforeLabel.offsetWidth
			},

			afterLabelWidth () {
				return this.afterLabel.offsetWidth
			},

			handle () {
				return this.container.querySelector('.comprasion__handle')
			}
		},

		methods: {
			updateClip (coords) {
				coords = coords || this.clipCoords()

				this.afterImage.style.clip = "rect(0, " + coords.x + "px, " + coords.y + "px, 0)"
				this.hideBeforeLabel = coords.x > this.container.offsetWidth - this.beforeLabelWidth
				this.hideAfterLabel = this.afterLabelWidth > coords.x
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
				this.height = this.container.offsetWidth / this.baseWidth * this.baseHeight
				this.reset()
			},

      getParentSwitcher (el) {
        el = el || this.$el
        if (el.className === undefined) return false
        if (el.className.indexOf('uk-switcher') > -1) return el
        return this.getParentSwitcher(el.parentNode)
      }
		}
	}
</script>
