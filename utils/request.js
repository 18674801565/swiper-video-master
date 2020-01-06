import baseurl from 'config.js'
const request = function(options) {
     options.url = baseurl.basehttpsurl + options.url;
     try {
       const token = uni.getStorageSync('token');
       if (token) {
         options.header = {
           'Authorization' : 'Bearer ' + token
         };
        }
     } catch (err) {
      console.log(err)
    }
    return uni.request(options);
  }
export default request;