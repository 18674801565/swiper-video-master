<template>
	<view>
		<view class="top">
			<view class="top-left">
				<image class="top-left-img" src="../../static/arrow_left.png" @click="back"></image>
			</view>
			<view class="top-right">{{pagetext}}</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			};
		},
		methods:{
			back(){
				let pages = getCurrentPages(); // 当前页面
				let beforePage = pages[pages.length - 2]; // 前一个页面
				uni.navigateBack({
				    success: function() {
				        beforePage.onLoad(); // 执行前一个页面的onLoad方法
				    }
				});
			}
		},
		props:['pagetext']
	}
</script>

<style lang="less">
	
.top{
	height: 80rpx;
	padding-top: 50rpx;
	width: 100%;
	font-size: 32rpx;
	display: flex;
	.top-left{
		height: 100%;
		width: 100rpx;
		.top-left-img{
			height: 60rpx;
			width: 70rpx;
			padding: 10rpx 0rpx;
			padding-left: 30rpx;
		}
	}
	.top-right{
		height: 100%;
		line-height: 80rpx;
		color: #fff;
	}
}
</style>
