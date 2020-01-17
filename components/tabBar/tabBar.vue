<template>
	<view class="wap">
		<view class="wap_relative" :style="{'background-color':selection == 1 ? 'rgba(0,0,0,0.05)' : '#000'}">
			<view class="tabar" @click.stop="redirectTo('../../pages/index/index')">
				<view :class="[selection == 1 ? 'cover-span spancolor' : 'cover-span']">首页</view>
			</view>
			<view class="tabar" @click.stop="redirectTo('../../pages/Release/Release')">
				<cover-image class="issue" src="../../static/jia.png"></cover-image>
			</view>
			<view class="tabar" >
				<!-- <view  :class="[selection == 2 ? 'cover-span spancolor' : 'cover-span']">我的</view> -->
				<button :class="[selection == 2 ? 'cover-span spancolor' : 'cover-span']" @click="user?redirectTo('../../pages/my/my'):getMyUserInfo()" open-type="getUserInfo">我的</button>
			</view>
		</view>

	</view>
</template>
<script>
	import request from "../../utils/request.js"
	
	export default {
		name: "taber",
		data() {
			return {
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
		 onLoad() {
		    // 查看是否授权
		    wx.getSetting({
		      success(res) {
		        if (res.authSetting['scope.userInfo']) {
		          // 已经授权，可以直接调用 getUserInfo 获取头像昵称
		          wx.getUserInfo({
		            success(res) {
		              console.log(res.userInfo)
		            }
		          })
		        }
		      },
			  fail(){
				 //未授权，授权
				wx.getUserInfo({
				  success(res) {
				    console.log(res.userInfo)
				  }
				})  
			  }
			  
		    })
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
										success: async (res) => {
											//openId����SessionKdy�洢//����loading
											console.log(res)
											if (res.data.status === 200) {
												uni.setStorageSync('token', res.data.token);
												await uni.getUserInfo({
													provider: 'weixin',
													success: function(infoRes) {
														console.log('第一次授权成功')
													    _this.nickName = infoRes.userInfo.nickName; //�ǳ�
													    _this.avatarUrl = infoRes.userInfo.avatarUrl; //ͷ��
													    _this.updateUserInfo(); 
													
													},	
													fail:function(){
														console.log('第一次授权失败了')
														uni.getUserInfo({
															provider: 'weixin',
															success: function(infoRes) {
																console.log('第二次授权成功')
																
																
															},	
															fail:function(){
																console.log('第二次授权失败了')
																uni.clearStorageSync('token');
																uni.clearStorageSync('user');
															}
														});
													}
												});
												
											}else if(res.data.status === 10107){
												uni.clearStorageSync('token');
												uni.clearStorageSync('user');
												uni.showToast({
													icon: 'none',
													title: `登录已失效`
												})	
											}
											console.log('token', uni.getStorageSync('token'))
											//��Ȩ�ɹ�����ȡ�û����ݴ������ݿ�
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
						async getMyUserInfo(){
							await this.login()
							let _this = this
							//�ǵ�һ����Ȩ��ȡ�û���Ϣ
						
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
		z-index: 998;
	}

	.wap_relative {
		width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		direction: row;
		flex-direction: row;
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
			border: 0rpx;
			background-color: rgba(0,0,0,0);
		}
	}

</style>
