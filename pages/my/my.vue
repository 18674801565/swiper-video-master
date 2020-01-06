<template>
	<view class="my">
		<tabar :index="2" />
		<button @click="login">授权</button>
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
				 SessionKey: '',
				 OpenId: '',
				 nickName: null,
				 avatarUrl: null,
				 gender:null,
				 isCanUse: uni.getStorageSync('isCanUse')||true//默认为true
			}
		},
		onLoad() {
	
		},
		methods: {
	　       //登录
	        login() {
	                let _this = this;
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
	                                        _this.updateUserInfo();//调用更新信息方法
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
									if(res.data.status===200){
										uni.setStorageSync('token', res.data.token);
									}
									console.log('token',uni.getStorageSync('token'))
					                        //授权成功后获取用户数据存入数据库
				                             uni.getUserInfo({
				                               provider: 'weixin',
				                               success: function(infoRes) {
				　　　　　　　　　　　　　　　　　　　　　　//获取用户信息后向调用信息更新方法
			                                        console.log(infoRes.userInfo)
				                                   _this.nickName = infoRes.userInfo.nickName; //昵称
				                                   _this.avatarUrl = infoRes.userInfo.avatarUrl; //头像
												   _this.gender = infoRes.userInfo.gender
				                                   _this.updateUserInfo();//调用更新用户信息方法
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
					console.log('_this.nickName',_this.nickName)
	                request({
	                    url:'/wechat/update/userinfo' ,//服务器端地址
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
	                            uni.reLaunch({//信息更新成功后跳转到小程序首页
	                                url: '/pages/index/index'
	                            });
	                        }
	                    }
	                   
	                });
	            }
		}
	}
</script>

<style>
</style>
