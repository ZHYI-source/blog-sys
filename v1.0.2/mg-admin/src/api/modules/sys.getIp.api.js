
import axios from "axios";
import {post} from "../../../../mg-client/src/api/http";

//获取ip
export const dirIPShare = (data) =>{
  return new Promise((resolve, reject) => {
    axios.get('/req_ip/cityjson').then(res=>{
      resolve(res.data)
    }).catch(err=>{
      reject(err)
    })
  })
}
//记录访客
export const recordVisitor = (data) =>
  post("/mg/api/public/common/visitor/record", data);

