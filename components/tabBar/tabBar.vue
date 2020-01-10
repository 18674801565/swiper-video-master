<template>
	<cover-view class="wap">
		<cover-view class="wap_relative" :style="{'background-color':selection == 1 ? 'rgba(0,0,0,0.05)' : '#000'}">
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/index/index')">
				<cover-view :class="[selection == 1 ? 'cover-span spancolor' : 'cover-span']">棣栭〉</cover-view>
			</cover-view>
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/Release/Release')">
				<cover-image class="issue" src="../../static/jia.png"></cover-image>
			</cover-view>
			<cover-view class="tabar" @click.stop="user?redirectTo('../../pages/my/my'):login()">
				<cover-view :class="[selection == 2 ? 'cover-span spancolor' : 'cover-span']">鎴戠殑</cover-view>
			</cover-view>
		</cover-view>
	</cover-view>
</template>
<script>
	import request from "../../utils/request.js"
	
	export default {
		name: "taber",
		data() {
			return {
				selection: 1,
				user:uni.getStorageSync('user')
			};
		},
		props: ["index"],
		created() {
			this.selection = this.index;
		},
		methods: {
						redirectTo(e) {
							uni.navigateTo({
								url: e
							});
						},
						//登录
						login() {
							let _this = this;
							_this.shade=false;
							// uni.showLoading({
							//     title: '登录中...'
							// });
							// 1.wx获取登录用户code
							uni.login({
								provider: 'weixin',
								success: function(loginRes) {
									let code = loginRes.code;
									if (!_this.isCanUse) {
										//非第一次授权获取用户信息
										uni.getUserInfo({
											provider: 'weixin',
											success: function(infoRes) {
												//获取用户信息后向调用信息更新方法
												let nickName = infoRes.userInfo.nickName; //昵称
												let avatarUrl = infoRes.userInfo.avatarUrl; //头像
												_this.updateUserInfo(); //调用更新信息方法
											}
										});
									}
									//2.将用户登录code传递到后台置换用户SessionKey、OpenId等信息
									request({
										url: '/wechat/login',
										data: {
											code: code,
										},
										method: 'POST',
										header: {
											'content-type': 'application/json'
										},
										success: (res) => {
											//openId、或SessionKdy存储//隐藏loading
											console.log(res)
											if (res.data.status === 200) {
												uni.setStorageSync('token', res.data.token);
											}
											console.log('token', uni.getStorageSync('token'))
											//授权成功后获取用户数据存入数据库
											uni.getUserInfo({
												provider: 'weixin',
												success: function(infoRes) {
													//获取用户信息后向调用信息更新方法
													console.log(infoRes.userInfo)
													_this.nickName = infoRes.userInfo.nickName; //昵称
													_this.avatarUrl = infoRes.userInfo.avatarUrl; //头像
													_this.gender = infoRes.userInfo.gender
													_this.updateUserInfo(); //调用更新用户信息方法
												}
											});
											// uni.hideLoading();
										}
									});
								},
							});
						},
						//向后台更新信息
						updateUserInfo() {
							let _this = this;
							console.log('_this.nickName', _this.nickName)
							request({
								url: '/wechat/update/userinfo', //服务器端地址
								data: {
									phoneNumber: null,
									nickName: _this.nickName,
									headUrl: _this.avatarUrl,
									gender: _this.gender
								},
								method: 'POST',
								header: {
									'content-type': 'application/json'
								},
								success: (res) => {
									if (res.data.status === 200) {
										uni.setStorageSync('user',res.data.data)
										uni.navigateTo({
											url:'../../pages/my/my'
										})
									}
								}
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
