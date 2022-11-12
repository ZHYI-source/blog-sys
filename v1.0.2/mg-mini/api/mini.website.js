import {post} from "./http";

//站点信息
export const dirWebsiteList = (data) =>
    post("/api/public/web/website/list", data);
//社交信息
export const dirSocialsList = (data) =>
    post("/api/public/web/socials/list", data);
//关于博主信息
export const dirAboutList = (data) =>
    post("/api/public/web/about/list", data);
//关于音乐信息
export const dirMusicList = (data) =>
    post("/api/public/web/music/list", data);
//标签云
export const dirTagsList = (data) =>
    post("/api/public/web/tags/list", data);
