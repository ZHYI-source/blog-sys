/**
 *@author ZY
 *@date 2022/5/16
 *@Description:公共请求处理
 */
import log from "./utils.log";
import config from "../config/server.config";
import toast from "../utils/utils.toast";

//请求头
const getHeader = () => {
    return {
        'Content-Type': 'application/json;charset=UTF-8',
        'mini-token': '' //token
    }
}
/**
 * @param method 请求方式
 * @param url 请求URL
 * @param data 请求数据
 * @returns {Promise}
 */
const service = function (method, url, data) {
    return new Promise((resolve, reject) => {
        uni.request({
            url: config.SERVER_URL + url,
            data: data,
            header: getHeader(),
            method: method,
            success: (res) => {
                switch (res.statusCode) {
                    case 200: {
                        let json = res.data;
                        log.capsule('请求成功:', url, 'success')
                        resolve(json);
                        break;
                    }
                    default: {
                        let err = {
                            state: res.statusCode,
                            msg: res.data.meta.msg
                        };
                        log.capsule('请求出错:', url, 'danger')
                        toast.error('请求出错')
                        reject(err);
                        break;
                    }
                }
            },
            fail: (res) => {
                log.capsule('请求失败:', url, 'danger')
                log.danger(JSON.stringify(res.data))
                toast.error('网络错误')
                reject(res);
            },
            complete: (res) => {
                // log.capsule('请求完成:',url,'primary')
            }
        });
    })
}
export default service
