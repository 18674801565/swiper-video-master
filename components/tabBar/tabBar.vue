<template>
	<cover-view class="wap">
		<cover-view class="wap_relative" :style="{'background-color':selection == 1 ? 'rgba(0,0,0,0.05)' : '#000'}">
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/index/index')">
				<cover-view :class="[selection == 1 ? 'cover-span spancolor' : 'cover-span']">首页</cover-view>
			</cover-view>
			<cover-view class="tabar" @click.stop="redirectTo('../../pages/Release/Release')">
				<cover-image class="issue" src="../../static/jia.png"></cover-image>
			</cover-view>
			<cover-view class="tabar" @click.stop="user?redirectTo('../../pages/my/my'):login()">
				<cover-view  :class="[selection == 2 ? 'cover-span spancolor' : 'cover-span']">我的</cover-view>
			</cover-view>
		</cover-view>
		<view class="shade" v-if="shade">
			<view class="shade-relative">
				<view class="shade-main">
					<view class="title">
						授权
					</view>
					<button @click="getUserInfo" open-type="getUserInfo">授权</button>
				</view>
			</view>
		
		</view>
	</cover-view>
</template>
<script>
	import request from "../../utils/request.js"
	
	export default {
		name: "taber",
		data() {
			return {
				shade:false,
				selection: 1,
				user:uni.getStorageSync('user'),
				avatarUrl:null,
				nickName:null
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
						//��¼
						login() {
							let _this = this;
							_this.shade=false;
							// uni.showLoading({
							//     title: '��¼��...'
							// });
							// 1.wx��ȡ��¼�û�code
							uni.login({
								provider: 'weixin',
								success: function(loginRes) {
									let code = loginRes.code;
									if (!_this.isCanUse) {
									
									}
									//2.���û���¼code���ݵ���̨�û��û�SessionKey��OpenId����Ϣ
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
											//openId����SessionKdy�洢//����loading
											console.log(res)
											if (res.data.status === 200) {
												uni.setStorageSync('token', res.data.token);
											}
											console.log('token', uni.getStorageSync('token'))
											//��Ȩ�ɹ�����ȡ�û����ݴ������ݿ�
											_this.shade = true
											// uni.hideLoading();
										}
									});
								},
							});
						},
						//����̨������Ϣ
						updateUserInfo() {
							let _this = this;
							console.log('_this.nickName', _this.nickName)
							request({
								url: '/wechat/update/userinfo', //�������˵�ַ
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
									console.log(res)
									if (res.data.status === 200) {
										uni.setStorageSync('user',res.data.data)
										uni.navigateTo({
											url:'../../pages/my/my'
										})
									}
								}
							});
						},
						async getUserInfo(){
							let _this = this
							//�ǵ�һ����Ȩ��ȡ�û���Ϣ
							await uni.getUserInfo({
								provider: 'weixin',
								success: function(infoRes) {
									//��ȡ�û���Ϣ����������Ϣ���·���
									_this.nickName = infoRes.userInfo.nickName; //�ǳ�
									_this.avatarUrl = infoRes.userInfo.avatarUrl; //ͷ��
									_this.updateUserInfo(); //���ø�����Ϣ����
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
