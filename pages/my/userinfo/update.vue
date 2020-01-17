<template>
	<view class="update">
		<top :pagetext="'修改'+text"></top>
		<view class="wap" v-if="code==1">
			<view class="tiele">
				我的昵称
			</view>
			<input type="text" v-model="value" class="input" maxlength="20" />
			<view class="sizeleng">
				{{value.length}}/20
			</view>
		</view>
		<view class="wap" v-if="code==2">
			<view class="tiele">
				我的倒斗号
			</view>
			<input type="text" v-model="value" class="input" maxlength="16" />
			<view class="sizeleng">
				{{value.length}}/16
			</view>
		</view>
		<view class="wap" v-if="code==3">
			<view class="tiele">
				个人简介
			</view>
			<textarea class="textarea" maxlength='-1' v-model="value" />
			</view>
		<view class="wap" v-if="code==4">
			<view class="tiele">
				性别
			</view>
			<view :class="{'sex':true,'sexcolor':value==0?'sexcolor':''}" style="margin-top: 10rpx;" @click="this.value=0">
				男
			</view>	
			<view :class="{'sex':true,'sexcolor':value==1?'sexcolor':''}" @click="this.value=1">
				女
			</view>	
		</view>
		<button type="default" @click="Bupdate">保存</button>
	</view>
</template>

<script>
	import top from '../../../components/back/top-back.vue'
	import request from "../../../utils/request.js"
	export default {
		data() {
			return {
				code: 1,
				text: null,
				value: null
			}
		},
		onLoad(e) {
			this.code = e.code;
			var user =uni.getStorageSync('user')
			this.id=user.id
			if (this.code == 1) {
				this.text = "昵称"
				this.value=user.nickName
			} else if (e.code == 2) {
				this.text = "倒斗号"
				this.value=user.myId
			} else if (e.code == 3) {
				this.text = "简介"
				this.value=user.profile
			} else if (e.code == 4) {
				this.text = "性别"
				this.value=user.gender
			} else if (e.code == 5) {
				this.text = "地区"
				this.value=user.region
			}
		},
		components: {
			top
		},
		methods:{
			Bupdate(){
				var code =this.code;
				var value =this.value;
				var id =this.id;
				request({
					url: '/user/userDetails',
					data: {
						code: code,
						value:value,
						id:id
					},
					method: 'POST',
					header: {
						'content-type': 'application/json'
					},
					success: (res) => {
						console.log(res.data)
						if (res.data.status === 200) {
							uni.setStorageSync('user',res.data.data);
							 let pages = getCurrentPages(); // 当前页面
							 let beforePage = pages[pages.length - 2]; // 前一个页面
							 uni.navigateBack({
							     success: function() {
							         beforePage.onLoad(); // 执行前一个页面的onLoad方法
							     }
							 });
						}
					}
				});
			}
		}
	}
</script>

<style>
	.update {
		background-color: #2b2828e8;
		height: calc(100vh);
	}

	.wap {
		margin-top: 15rpx;
		;
		width: 100%;
		padding: 40rpx;
		box-sizing: border-box;
	}

	.tiele {
		color: #8B8C91;
		font-size: 25rpx;
	}

	.input {
		font-size: 25rpx;
		color: #FFFFFF;
		padding: 20rpx 0;
		border-bottom: 0.5px solid #262834;
	}

	.sizeleng {
		color: #8B8C91;
		padding: 25rpx 0 0 0;
		font-size: 25rpx;
	}

	.textarea {
		margin-top: 20rpx;
		width: 100%;
		background-color: rgba(255, 255, 255, 0.05);
		color: #FFFFFF;
		padding: 15rpx;
		font-size: 25rpx;
		box-sizing: border-box;
		border-radius: 4rpx;
	}
	
	.sex{
		color: #FFFFFF;
		font-size: 25rpx;
		padding: 10rpx 20rpx;
		border-radius:4rpx ;
		box-sizing: border-box;
		transition: 0.3s all;
	}
	.sexcolor{
		background-color: #FFFFFF;
		color: #000000;
	}
</style>
