<template>
	<view>
		<web-view :src="weatl.url"></web-view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				weatl:{}
			}
		},
		onLoad(e) {
			this.weatl = e
			console.log(e.url)
			console.log(this.weatl)
		},
		methods: {
			
		}
	}
</script>

<style>

</style>
