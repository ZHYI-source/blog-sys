



import {get} from "./http";
import axios from "axios";

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
