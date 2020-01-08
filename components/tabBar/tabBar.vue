<template>
	<cover-view class="wap">
		<cover-view class="wap_relative" :style="{'background-color':Selection == 1 ? 'rgba(0,0,0,0.05)' : '#000'}">
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/index/index')">
				<cover-view :class="[Selection == 1 ? 'cover-span spancolor' : 'cover-span']">首页</cover-view>
			</cover-view>
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/Release/Release')">
				<cover-image class="issue" src="../../static/jia.png"></cover-image>
			</cover-view>
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/my/my')">
				<cover-view :class="[Selection == 2 ? 'cover-span spancolor' : 'cover-span']">我的</cover-view>
			</cover-view>
		</cover-view>
	</cover-view>
</template>
<script>
	export default {
		name: "taber",
		data() {
			return {
				Selection: 1
			};
		},
		props: ["index"],
		created() {
			this.Selection = this.index;
		},
		methods: {
			redirectTo(e) {
				uni.redirectTo({
					url: e
				});
			}
		}
	};
</script>
<style lang="scss" scoped>
	.wap {
		position: fixed;
		z-index: 999;
		left: 0;
		bottom: 0;
		height: 50px;
		// background-color: #000;
		width: 100%;
		z-index: 999;
	}

	.wap_relative {
		width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		justify-content: space-around;
	}

	.tabar {
		display: flex;
		align-items: center;
		justify-content: space-around;
		width: 33%;

		span {
			font-size: 14px;
			color: lightslategray;
		}

		.spancolor {
			color: #FFFFFF;
		}
		.issue{
			height: 30px;
			width: 30px;
		}
		.cover-span{
			display: inline;
			font-size: 16px;
			color: #FFFFFF;
		}
	}
</style>
