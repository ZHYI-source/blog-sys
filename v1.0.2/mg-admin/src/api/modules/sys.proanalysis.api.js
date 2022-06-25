import {get, post} from "@/api/http";

export const dirProanalysisList = (data) =>
  post("/mg/api/private/proanalysis/list", data);


export const dirProanalysisDelete = (id) =>
  post("/mg/api/private/proanalysis/delete", {id});


export const dirProanalysisCreate = (data) =>
  post("/mg/api/private/proanalysis/create", data);

export const dirProanalysisUpdate = (data) =>
  post("/mg/api/private/proanalysis/update", data);
