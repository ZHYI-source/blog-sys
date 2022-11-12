

import {post} from "./http";

//站点信息
export const dirWebsiteList = (data) =>
    post("/mg/api/public/web/website/list", data);
//社交信息
export const dirSocialsList = (data) =>
    post("/mg/api/public/web/socials/list", data);
//关于博主信息
export const dirAboutList = (data) =>
    post("/mg/api/public/web/about/list", data);
//关于音乐信息
export const dirMusicList = (data) =>
  post("/mg/api/public/web/music/list", data);
//记录访客
export const recordVisitor = (data) =>
  post("/mg/api/public/common/visitor/record", data);
