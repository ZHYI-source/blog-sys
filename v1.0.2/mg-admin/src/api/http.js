/**
 *@author ZY
 *@date 2022/2/10
 *@Description:请求方式的封装
*/

// 封装axios的post请求
import request from "../libs/utils.request";
// import {request} from "./service";

export function post(url, params,opt) {
    return new Promise((resolve, reject) => {
        request.post(url, params).then(response => {
            resolve(response.data)
        })
            .catch((error) => {
                reject(error)
            })
    })
}

// 封装axios的get请求
export function get(url, params) {
    return new Promise((resolve, reject) => {
        request.get(url, params)
            .then(response => {
                resolve(response.data)
            })
            .catch((error) => {
                reject(error)

            })

    })
}
