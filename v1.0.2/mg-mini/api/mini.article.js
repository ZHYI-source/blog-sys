import {post} from "./http";

//文章列表
export const dirArticle = (data) =>
    post("/api/public/web/article/list", data);
//文章详情
export const getArticleDetail = (id) =>
    post("/api/public/web/article/detail", {id});

//文章归档
export const getArticleGroup = (data) =>
    post("/api/public/web/article/group", data);

//文章评论
export const getCommentsList = (data) =>
    post("/api/public/web/comments/list", data);

//添加评论
export const getCommentsCreate = (data) =>
    post("/api/public/web/comments/create", data);

