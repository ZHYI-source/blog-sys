import {get, post} from "@/api/http";

export const dirTravelList = (data) =>
  post("/mg/api/private/travel/list", data);


export const dirTravelDelete = (id) =>
  post("/mg/api/private/travel/delete", {id});


export const dirTravelCreate = (data) =>
  post("/mg/api/private/travel/create", data);

export const dirTravelUpdate = (data) =>
  post("/mg/api/private/travel/update", data);

export const dirTravelFindOne = (data) =>
  post("/mg/api/private/travel/findOne", data);


export const dirTravelListDetail = (data) =>
  post("/mg/api/private/travel/listDetail", data);


export const dirTravelDeleteDetail = (id) =>
  post("/mg/api/private/travel/deleteDetail", {id});


export const dirTravelCreateDetail = (data) =>
  post("/mg/api/private/travel/createDetail", data);

export const dirTravelUpdateDetail = (data) =>
  post("/mg/api/private/travel/updateDetail", data);

export const dirTravelFindOneDetail = (data) =>
  post("/mg/api/private/travel/findOneDetail", data);
