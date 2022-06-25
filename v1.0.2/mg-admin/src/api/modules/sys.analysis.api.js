import {get, post} from "@/api/http";

export const dirAnalysisList = (data) =>
  post("/mg/api/private/analysis/list", data);


export const dirAnalysisDelete = (id) =>
  post("/mg/api/private/analysis/delete", {id});

export const dirAnalysisDeleteAll = (pid) =>
  post("/mg/api/private/analysis/deleteAll", {pid});


export const dirAnalysisCreate = (data) =>
  post("/mg/api/private/analysis/create", data);

export const dirAnalysisUpdate = (data) =>
  post("/mg/api/private/analysis/update", data);

export const analysisDownloadTemplate = (data) =>
  post("/mg/api/private/analysis/downloadTemplate", data,);
//导入
export const analysisImportExcel = (data) =>
  post("/mg/api/private/analysis/importExcel", data,);
//导出
export const analysisExportExcel = (data) =>
  post("/mg/api/private/analysis/exportExcel", data,);
