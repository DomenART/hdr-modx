<template>
	<div>
		<header class="comprasion__header uk-flex uk-flex-between uk-flex-middle">
			<div class="comprasion__title">Какой стиль интерьера выберешь ты?</div>
			<a class="comprasion__select" :href="images[second].url">Выберите свой интерьер</a>
		</header>

		<comprasion :initial-before-image='images[main].image' :initial-after-image='images[second].image' :initial-before-label='images[main].name' :initial-after-label='images[second].name'></comprasion>

		<div class="comprasion-thumbs uk-grid uk-child-width-1-2 uk-child-width-1-4@s" uk-grid>
			<div v-for="(item, index) in images" :key="item.MIGX_id" :class="'comprasion-thumb' + (index==main?' uk-active':'')" @click="setMain(index)">
				<div class="comprasion-thumb__image"><img :src="item.image" alt=""></div>
				<div class="comprasion-thumb__name" v-html="item.name"></div>
			</div>
		</div>
	</div>
</template>

<script>
	module.exports = {
		props: ['initialImages'],

		data () {
			return {
				images: JSON.parse(this.initialImages),
				main: 0,
				second: 1
			}
		},

		methods: {
			setMain (index) {
				if(index == this.main) return

				let main = this.main
				let second = this.second

				this.second = this.main
				this.main = index
			}
		}
	}
</script>
