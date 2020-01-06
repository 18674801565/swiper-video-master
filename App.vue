<script>
	export default {
		onLaunch: function() {
			var logs = uni.getStorageSync('logs') || []
			uni.setStorageSync('logs', logs);
			uni.getSetting({
				success(res) {
					if (res.authSetting['scope.userInfo']) {
						uni.getUserInfo({
							provider: 'weixin',
							success: function(infoRes) {
								this.globalData.userInfo = infoRes.userInfo
							}
						});
						if (this.userInfoReadyCallback) {
							this.userInfoReadyCallback(res)
						}
					}
				}
			})
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		},
		globalData: {
			userInfo: null
		},
	}
</script>

<style>
	/*每个页面公共css */
</style>
