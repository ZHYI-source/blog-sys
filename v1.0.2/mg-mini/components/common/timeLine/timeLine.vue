<template>
	<view class="time-content">
		<slot></slot>
		<!-- <view class="time-line-box" v-for="(item,index) in 10" :key="index">
			<view class="time-line-item">123</view>
		</view> -->
	</view>
</template>

<script>
	export default {
		name: 'timeLine',
		data() {
			return {
				dataList: [],
				cateName: '',
				count: 0,
			}
		},

		methods: {

		},
		onLoad(opt) {
		
		},
	}
</script>

<style lang="scss">
	 
</style>
