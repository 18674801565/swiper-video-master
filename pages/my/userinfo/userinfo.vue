<template>
	<view class='info-body'>
		<top pagetext="我的详情"></top>
		<view class="head">
			<view class="avatar-container">
				<image class="avatar" :src="user.avatarUrl?user.avatarUrl:'../../../static/logo.png'" @click="schooseImage()"></image>
				<cover-image class="avatar-over" src="../../../static/camera.png" @click="schooseImage()"></cover-image>
			</view>
		</view>
		<view class="info-list">
			<view class="info-item">
				<view class="info-item-left">昵称</view>
				<view class="info-item-right" @click="updateuser(1)">
					<span>{{user.nickName?user.nickName:'***'}}</span>
				</view>
				<image class="to-right-icon" src="../../../static/arrow_right.png"></image>
			</view>
			<view class="info-item">
				<view class="info-item-left">倒斗号</view>
				<view class="info-item-right" @click="updateuser(2)">{{user.myId?user.myId:'***'}}
				</view>
				<image class="to-right-icon" src="../../../static/arrow_right.png"></image>
			</view>
			<view class="info-item">
				<view class="info-item-left">简介</view>
				<view class="info-item-right" @click="updateuser(3)">{{user.profile?user.profile:'***'}}
				</view>
				<image class="to-right-icon" src="../../../static/arrow_right.png"></image>
			</view>
			<view class="info-item">
				<view class="info-item-left">性别</view>
				<view class="info-item-right" @click="updateuser(4)">{{user.gender==1?'女':'男'}}
				</view>
				<image class="to-right-icon" src="../../../static/arrow_right.png"></image>
			</view>
			<view class="info-item">
				<view class="info-item-left">地区</view>
				<view class="info-item-right" @click="updateuser(5)">{{user.region?user.region:'***'}}
				</view>
				<image class="to-right-icon" src="../../../static/arrow_right.png"></image>
			</view>
		</view>
	</view>
</template>

<script>
	import top from '../../../components/back/top-back.vue'
	import request from '../../../utils/request.js'
	export default {
		data() {
			return {
				user: uni.getStorageSync('user')
			}
		},
		onLoad(){
			this.user=uni.getStorageSync('user')
		},
		methods: {
			updateuser(e){
				console.log(e)
				uni.navigateTo({
				    url: './update?code='+e
				});
			},
			schooseImage() {
				// request({
				// 	url: '/user/userDetails/avatarUrl',
				// 	method: 'POST',
				// 	success: (res) => {
				// 		console.log(res)
				// 	},
				// 	fail:(err)=>{
				// 		console.log(err)
				// 	}
				// 	})
				uni.chooseImage({
				    success: (chooseImageRes) => {
				        const tempFilePaths = chooseImageRes.tempFilePaths;
						const token = uni.getStorageSync('token');
				        uni.uploadFile({
				            url: 'https://localhost:5000/user/userDetails/avatarUrl',
				            filePath: tempFilePaths[0],
				            name: 'file',
				            success: (uploadFileRes) => {
				                console.log(uploadFileRes.data);
				            },
							
							fail:(err)=>{
								console.log(err)
							}
				        });
				    }
				});
			}
			
		},
		components: {
			top
		}
	}
</script>

<style lang="less">
	.info-body {
		background-color: #2b2828e8;
		height: calc(100vh);

		.head {
			height: 240rpx;
			line-height: 240rpx;
			width: 100%;
			text-align: center;
			padding: 140rpx 0rpx 20rpx;

			.avatar-container {
				height: 200rpx;
				width: 200rpx;
				margin: 0 auto;
				position: relative;

				.avatar {
					position: absolute;
					height: 100%;
					width: 100%;
					top: 0;
					right: 0;
					opacity: 0.6;
					border-radius: 50%;
				}

				.avatar-over {
					position: absolute;
					height: 80rpx;
					width: 100rpx;
					top: 60rpx;
					right: 50rpx;
				}
			}
		}

		.info-list {
			font-size: 28rpx;
			color: #fff;

			.info-item {
				height: 90rpx;
				line-height: 90rpx;
				width: 100%;
				display: flex;

				.info-item-left {
					width: 25%;
					padding-left: 40rpx;
				}

				.info-item-right {
					text-align: right;
					width: 75%;

					.to-right-icon {
						height: 40rpx;
						width: 40rpx;
					}
				}

				.to-right-icon {
					height: 40rpx;
					width: 50rpx;
					padding: 25rpx 0rpx;
					padding-right: 30rpx;
					padding-left: 6rpx;
				}
			}
		}
	}
</style>
