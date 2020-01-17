<template>
	<view v-if='newPopupFlag' class="popup" id="popup">
		<view class="popup-top">
			<view class="top-text">{{pageCount}}条评论</view>
			<view class="top-right-icon">
				<cover-image class="close-icon" src="../../static/close.png" @click="closePopup()"></cover-image>
			</view>
		</view>
		<view class="popup-body">
			<view class="group-list" v-if="commentData&&commentData.length>0">
			<view class="comment-group" v-for="(item,i) in commentData" :key="i">
				<view :class="j===0?'reply':'replyed'" v-for="(item2,j) in item" :key="j">
					<cover-image class="comment-avator" :src="item2.avatarUrl"></cover-image>
					<view class="comment-body">
						<view class="comment-name">{{item2.replyNickName}}</view>
						<view class="comment-info">
					    <view>{{item2.content}}
						<view class="comment-time">{{item.createTime}}</view>
						</view>
						
						</view>
						
					</view>
					<view class="comment-like-num">
						<cover-image class="comment-like" src="../../static/aixinhui.png"></cover-image>
						<view class="like-num">{{item2.commentLike}}</view>
					</view>
				</view>
	<!-- 			<view class="replyed">
					<image class="comment-avator" src="../../static/logo.png"></image>
					<view class="comment-body">
						<view class="comment-name">李四</view>
						<view class="comment-info">
					    <span> hahhaaaaassssssssssssssssssssssssssssssssssrrrrrrr
						<span class="comment-time">2019-2-2</span>
						</span>
						
						</view>
					</view>
					<view class="comment-like-num">
						<image class="comment-like" src="../../static/aixinhui.png"></image>
						<span class="like-num">123</span>
					</view>
				</view>
				<view class="replyed">
					<image class="comment-avator" src="../../static/logo.png"></image>
					<view class="comment-body">
						<view class="comment-name">李四</view>
						<view class="comment-info">
					    <span> 加上打卡机啊很深刻的哈is阿活动啊四的厚爱山东济南I欧艾斯JAIS
						<span class="comment-time">2019-2-2</span>
						</span>
						
						</view>
					</view>
					<view class="comment-like-num">
						<image class="comment-like" src="../../static/aixinhui.png"></image>
						<span class="like-num">123</span>
					</view>
				</view> -->
			</view>
			

			
		  </view>
		  <view class="null-comment" v-else>空空如也</view>
		</view>
	</view>
</template>

<script>
	import request from "../../utils/request.js"
	export default {
		data() {
			return {
				newPopupFlag:false,
				commentData:[],
				pageNum:1,
				pageSize:8,
				pageCount:0
			};
		},
		props: ["type",'pHeight','popupFlag'],
		created(){
			this.commentData = []
			//this.initPopup()
			//this.getCommentInfo()
		},
		mounted() {
			this.initPopup()
			//this.getCommentInfo()
		},
		methods:{
			getCommentInfo(id){
				console.log(id)
				let _this = this
				request({
					url: '/index/getCommentInfo', //服务器端地址
					data: {
						pageNum:1,
						pageSize:8,
						videoId:id
					},
					method: 'GET',
					header: {
						'content-type': 'application/json'
					},
					success: (res) => {
						console.log(res)
						if (res.data.status === 200) {
							_this.commentData = res.data.data.data
							_this.pageCount =  res.data.data.pageCount
							console.log(_this.flag)
						}
					}
				});
			},
			changeShow(id){
				this.getCommentInfo(id)
				this.newPopupFlag = !this.newPopupFlag
			},
			initPopup(){
			
			},
			closePopup(){
				this.newPopupFlag = false
			}
		}
	}
</script>

<style lang='less'>
.popup{

	        position: fixed;
			height: calc(72vh);
		    /* #ifndef H5 */
			/* #endif */
			bottom: 0;
			left: 0;
			right: 0;
			/* #ifndef APP-NVUE */
			z-index: 9999;
			background-color: #fff;
			border-radius: 40rpx 40rpx 0rpx 0rpx;

			/* #endif */
				
			.popup-top{
				height: 60rpx;
				width: 100%;
				position:relative;
				padding-top: 10rpx;
				margin-bottom: 20rpx;
				.top-text{
					line-height: 60rpx;
					width: 100%;
					font-size: 24rpx;
					text-align: center;
				}
				.top-right-icon{
					position: absolute;
					height: 100%;
					z-index: 9999;
					right: 20rpx;
					top: 10rpx;
					.close-icon{
						height: 50rpx;
						width:50rpx;
					}
				}
			}
				
	.popup-body{
		.null-comment{
			color: #ccc;
			font-size: 30rpx;
			margin-top: 40px;
			text-align: center;
		}
	  .group-list{
			height:calc(72vh - 60rpx);
			overflow-y:scroll; 
		.comment-group{
			min-height: 80rpx;
			width: 100%;
			.reply,.replyed{
				width: 100%;
				min-height: 80rpx;
				font-size: 28rpx;
				display: flex;
				flex-direction: row;
				justify-content: space-between;
				
				.comment-avator{
					height: 60rpx;
					width: 60rpx;
					border-radius: 50%;
					display: block;
					margin: 10rpx 20rpx 10rpx 40rpx;
				}
					
				.comment-body{
					width: auto;
					display: flex;
					width: 70%;
					.comment-name{
						height: 40rpx;
						color:#999999;
						overflow: hidden;
						font-size: 25rpx;
					}
					.comment-info{
						min-height: 40rpx;
						color:#000000;
						max-height: 400rpx;
						max-width: 100%;
						word-break: break-all;
							
						span{
							display: inline-block;
							font-size: 25rpx;
						}	
						.comment-time{
							color: #999999;
							font-size: 22rpx;
							margin-left: 10rpx;
						}
					}
				}
				.comment-like-num{
					width: 80rpx;
					text-align: center;
					.comment-like{
						height: 40rpx;
						margin: 0rpx 20rpx;
						width: 40rpx;
						overflow: inherit;
					}
					.like-num{
						color:#8a8a8a;
						font-size: 24rpx;
					}
				}
				
			}
			.replyed{
	 			width: 95%;
				margin-left: 5%;
		    }
		}
	}
  }
}
</style>
