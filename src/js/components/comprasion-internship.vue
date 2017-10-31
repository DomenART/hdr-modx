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

<style lang="less">
.comprasion__header {
	margin-bottom: 20px;
    @media (max-width:959px) {
		-ms-flex-wrap: wrap;
		-webkit-flex-wrap: wrap;
		flex-wrap: wrap;
		margin-bottom: 36px;
    }
}

.comprasion__title {
	color: #fefefe;
	font-family: 'Museo Sans', sans-serif;
	font-size: 24px;
	font-weight: 500;
	line-height: 1.125;
    @media (max-width:959px) {
		width: 100%;
		margin-bottom: 22px;
    }
    @media (max-width:639px) {
		margin-bottom: 30px;
    }
}

.comprasion__select {
	color: #cccccc;
	font-size: 18px;
	font-weight: 400;
	line-height: 1;
	text-decoration: none;
	&:hover {
		color: #fff;
		text-decoration: none;
	}
    @media (max-width:639px) {
		font-size: 16px;
    }
}

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

.comprasion__main__mask,
.comprasion__second__mask,
.comprasion__second,
.comprasion__main {
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
	&--main {
		right: 0;
	}
	&--second {
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

.comprasion-carousel {
	cursor: pointer;
}

.comprasion-carousel__item {
	margin-bottom: 10px;
	&:hover,
	&.active {
		opacity: 1;
		.comprasion-carousel__image img {
			opacity: 1;
		}
		.comprasion-carousel__title {
			color: #fff;
		}
	}
}

.comprasion-carousel__image {
	display: block;
	width: 100%;
	margin-bottom: 10px;
	background: #000;
	img {
		opacity: .4;
		transition: all ease .3s;
	}
}

.comprasion-carousel__title {
	color: #cccccc;
	font-size: 16px;
	line-height: 1.8;
    @media (max-width:959px) {
		display: none;
    }
}
</style>
