import baseurl from 'config.js'
const getToken= function(){
	return new Promise((resolve, reject) => {
		// 登录
		uni.login({
			success: res => {
				console.log(res)
				if (res.code) {
					// uni.request({
					//   url: ,
					//   method: 'POST',
					//   data: {
					//     code: res.code
					//   },
					//   success(res) {
					//     uni.setStorage({
					//       key: 'token',
					//       data: res.data.token
					//     });
					//     var resArg = res.data.token;
					//     resolve()
					//   },
					//   fail() {
					//     reject();
					//   }
					// })
				}
			}
		})
	})
}

export default getToken;