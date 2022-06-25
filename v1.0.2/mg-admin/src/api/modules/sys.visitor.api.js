
import {post} from "@/api/http";

export const dirVisitorList = (data) =>
  post("/mg/api/private/visitor/list", data);
