module.exports = {
    productionSourceMap: false,
    lintOnSave: false, //关闭lint校验
    devServer: {
        proxy: {
            '/mg': {
                target: 'http://localhost:5222', //本地服务器
                changeOrigin: true,
                pathRewrite: {
                    '^/mg': ''
                }
            },
          '/req_ip': {
            target: 'http://pv.sohu.com',
            changeOrigin: true,
            pathRewrite: {
              '^/req_ip': ''
            }
          }
        }
    },
}
