import {post} from "./http";

//友链列表
export const dirFriendsList = (data) =>
    post("/api/public/web/friends/list", data);
//添加留言
export const getMessageCreate = (data) =>
    post("/api/public/web/message/create", data);
