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
	import Velocity from 'velocity-animate'

	module.exports = {
		props: ['initialBeforeImage', 'initialAfterImage', 'initialBeforeLabel', 'initialAfterLabel'],

		data () {
			return {
        before: {
          image: this.initialBeforeImage,
          label: this.initialBeforeImage?this.initialBeforeLabel:'было'
        },
        after: {
          image: this.initialAfterImage,
          label: this.initialAfterImage?this.initialAfterLabel:'стало'
        },
				hideBeforeLabel: false,
				hideAfterLabel: false,
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
			}
		}
	}
</script>

<style lang="less">
.comprasion__arrows {
	text-align: center;
	margin-bottom: 10px;
	span {
		width: 32px;
		height: 21px;
		display: inline-block;
    	margin: 8px;
		&:first-child {
			background: url('../../img/icon-arrow-left.svg') no-repeat 50% 50%;
		}
		&:last-child {
			background: url('../../img/icon-arrow-right.svg') no-repeat 50% 50%;
		}
	}
    @media (max-width:959px) {
		display: none;
    }
}

.comprasion {
	position: relative;
	border-bottom: 1px solid #828281;
	max-width: 100%;
	margin: 0 0 30px;
}

.comprasion__before__mask,
.comprasion__after__mask,
.comprasion__after,
.comprasion__before {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-position: 50% 50%;
	background-size: cover;
	background-color: rgba(255,255,255,0);
}

.comprasion__label {
	position: absolute;
	bottom: 0;
	color: #cccccc;
	font-size: 16px;
	font-weight: 400;
	line-height: 1;
	padding: 12px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	&--before {
		right: 0;
	}
	&--after {
		left: 0;
	}
}

.comprasion__handle {
	position: absolute;
	width: 18px;
	height: 100%;
	left: 50%;
	top: 0;
	margin-left: -9px;
	cursor: move;
	&:hover {
		&:after {
			background-color: darken(#d3924d, 10%);
		}
	}
	&:after {
		content: '';
		position: absolute;
		left: 0;
		top: -15px;
		width: 100%;
		height: 18px;
		border-radius: 2px;
		background-color: #d3924d;
	}
	&:before {
		content: '';
		left: 50%;
		top: 0;
		width: 1px;
		height: 100%;
		background-color: #cccccc;
		position: absolute;
	}
}
</style>
