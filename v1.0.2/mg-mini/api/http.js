/**
 *@author ZY
 *@date 2022/2/10
 *@Description:请求方式的封装
 */
// post请求
import service from "../utils/utils.request";

export function post(url, params) {
    return new Promise((resolve, reject) => {
        service('POST', url, params).then(response => {
            resolve(response)
        }).catch((error) => {
            reject(error)
        })
    })
}

// get请求
export function get(url, params) {
    return new Promise((resolve, reject) => {
        service('GET',url, params)
            .then(response => {
                resolve(response)
            })
            .catch((error) => {
                reject(error)
            })

    })
}
