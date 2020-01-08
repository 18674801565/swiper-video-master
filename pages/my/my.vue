<template>
	<view class="my">
		<!--  -->
		<view class="head">
			<view class="head-left">
				<image :src="avatarUrl?avatarUrl:'../../static/logo.png'" @click="shade=true"></image>
			</view>
			<view class="head-right">
				<view class="haed-edit">
					编辑资料
				</view>
				<view class="head-plus">
					+好友
				</view>
			</view>
		</view>
		<!--  -->
		<view class="middle">
			<view class="middle-name">
				{{nickName?nickName:'用户名'}}
			</view>
			<view class="middle-id">
				id:<!-- {{OpenId?OpenId:''}} -->
			</view>
			<view class="middle-introduction">
				你还没有填写个人简介，点击添加
			</view>
		</view>
		<!--  -->
		<view class="Interaction">
			<view class="Interaction-Color">
				<span class="Interaction-Color2">
					0
				</span>
				获赞
			</view>
			<view class="Interaction-Color">
				<span class="Interaction-Color2">
					0
				</span>
				关注
			</view>
			<view class="Interaction-Color">
				<span class="Interaction-Color2">
					0
				</span>
				粉丝
			</view>
		</view>
		<!--  -->
		<view class="bottom">
			<view class="bottom-top">
				<view :class="{'bottom-title':true,'bottom-color':tab==1?true:false}" @click="tabNav(1)">
					作品<view class="bottom-size">0</view>
				</view>
				<view :class="{'bottom-title':true,'bottom-color':tab==2?true:false}" @click="tabNav(2)">
					收藏<view class="bottom-size">0</view>
				</view>
				<view :class="{'bottom-title':true,'bottom-color':tab==3?true:false}" @click="tabNav(3)">
					喜欢<view class="bottom-size">0</view>
				</view>
			</view>
			<!-- 选中条 -->
			<view class="bottom-b">
				<view :class="{'bottom-bar':true,'bottom-bar-color':tab==1?true:false}"></view>
				<view :class="{'bottom-bar':true,'bottom-bar-color':tab==2?true:false}"></view>
				<view :class="{'bottom-bar':true,'bottom-bar-color':tab==3?true:false}"></view>
			</view>
			<view class="bottom-main">
				{{tab}}
			</view>
		</view>
		<tabar :index="2" />
		<!-- 授权登录 -->
		<view class="shade" v-if="shade">
			<view class="shade-relative">
				<view class="shade-main">
					<view class="title">
						微信授权登录
					</view>
					<button @click="login" open-type="getUserInfo">授权</button>
				</view>
			</view>
		</view>
		
	</view>
</template>

<script>
	import request from "../../utils/request.js"
	import tabar from '../../components/tabBar/tabBar.vue'
	import login from '../../utils/login.js'
	export default {
		components: {
			tabar
		},
		data() {
			return {
				shade:false,
				tab:1,
				SessionKey: '',
				OpenId: '',
				nickName: null,
				avatarUrl: null,
				gender: null,
				isCanUse: uni.getStorageSync('isCanUse') || true //默认为true
			}
		},
		onLoad() {
			
		},
		methods: {
			// 切换选项（作品，收藏，喜欢）
			tabNav(e){
				this.tab=e
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
							console.log(res)
							// uni.reLaunch({ //信息更新成功后跳转到小程序首页
							// 	url: '/pages/index/index'
							// });
						}
					}

				});
			}
		}
	}
</script>

<style lang="less">
	.my {
		background-color: #141720;
		width: 100%;
	}

	// 
	.head {
		display: flex;
		align-items: center;
		padding: 100rpx 40rpx 50rpx;
		box-sizing: border-box;
		justify-content: space-between;

		.head-left {
			image {
				height: 180rpx;
				width: 180rpx;
				border-radius: 50%;
			}
		}

		.head-right {
			display: flex;

			.haed-edit {
				color: #D8D9DC;
				background-color: #363640;
				padding: 20rpx 70rpx;
				font-size: 30rpx;
				border-radius: 5rpx;
			}

			.head-plus {
				margin-left: 10rpx;
				color: #D8D9DC;
				background-color: #363640;
				padding: 20rpx 40rpx;
				font-size: 30rpx;
				border-radius: 5rpx;
			}
		}
	}

	// 
	.middle {
		padding: 0 30rpx;
		box-sizing: border-box;

		.middle-name {
			color: #5F5F67;
			font-size: 40rpx;
		}

		.middle-id {
			padding: 30rpx 0;
			font-size: 26rpx;
			color: #FFFFFF;
			border-bottom: 3rpx solid #20232C;
		}

		.middle-introduction {
			padding: 30rpx 0;
			font-size: 30rpx;
			color: #FFFFFF;
		}
	}
	// 
	.Interaction {
		display: flex;
		padding: 20rpx 40rpx;
		box-sizing: border-box;
		.Interaction-Color {
			margin-right: 30rpx;
			color: #5C5E63;
			font-weight: bold;
			font-size: 30rpx;
			display: flex;
			align-items: center;
		}
		.Interaction-Color2 {
			margin-right: 8rpx;
			font-size: 30rpx;
			color: #FFFFFF;
		}
	}
	// 
	.bottom{
		width: 100%;
		padding: 20rpx 40rpx;
		box-sizing: border-box;
		.bottom-top{
			width: 100%;
			display: flex;
			justify-content: center;
		}
		.bottom-title{
			display: flex;
			justify-content: center;
			width: 33.33%;
			padding: 20rpx 0;
			color: #6A6C72;
			font-size: 30rpx;
		}
		.bottom-color{
			color: #FFFFFF;
		}
		.bottom-size{
			margin-left: 10rpx;
		}
		.bottom-b{
			width: 100%;
			display: flex;
			border-bottom: 3rpx solid #20232C;
		}
		.bottom-bar{
			width: 33.33%;
			height: 4rpx;
			background-color:transparent;
			transition: 0.2s all ease-in;
		}
		.bottom-bar-color{
			background-color: #E7BF12;
		}
		.bottom-main{
			color: #FFFFFF;
			padding: 30rpx 0;
		}
	}
	// 
	.shade{
		position: fixed;
		left: 0;
		top:0;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.4);
		z-index: 99;
		.shade-relative{
			position: relative;
			width: 100%;
			height: 100%;
		}
		.shade-main{
			position: absolute;
			left:50%;
			top:50%;
			transform: translate(-50%,-50%);
			height: 300rpx;
			width: 400rpx;
			border-radius:8rpx ;
			background-color: #FFFFFF;
			display: flex;
			flex-direction: column;
			justify-content: space-around;
			align-items: center;
		}
	}
</style>
