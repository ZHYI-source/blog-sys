class Tools {
}

/**
 * 金额转换，保留2位小数
 * @param val
 * @returns {*}
 */
Tools.fmtVal2Money = function (val) {
  if (val === null || val === undefined || val === '') {
    return '0.00';
  }
  let value = val;
  let str = val.toString().split(".");
  if (str.length == 1) {
    value = value.toString() + ".00";
    return value;
  }
  if (str.length > 1) {
    if (str[1].length < 2) {
      value = value.toString() + "0";
    }
    return value;
  }
};

/**
 * 时间戳转换为时间yyyy-MM-dd hh:mm:ss
 * @param l 时间戳
 */
Tools.fmtLong2DateTime = function (l, fmtStr) {
  let crtTime = new Date(l);
  let fmt = 'yyyy-MM-dd hh:mm:ss';
  if (fmtStr) {
    fmt = fmtStr;
  }
  return fmtDateTime(fmt, crtTime);
};

/**
 * 时间戳转换为时间
 * @param fmt yyyy-MM-dd hh:mm:ss
 * @param date 时间对象
 * @returns {*}
 */
  //格式化星期
function dateWeek(date){
  let newDay = new Date(date).getDay()
   let day ="日一二三四五六".charAt(newDay)
  return "星期"+day
}

function fmtDateTime(fmt, date) {
  var o = {
    "M+": date.getMonth() + 1,                 //月份
    "d+": date.getDate(),                    //日
    "w+":  dateWeek(date),                 //星期
    "h+": date.getHours(),                   //小时
    "m+": date.getMinutes(),                 //分
    "s+": date.getSeconds(),                 //秒
    "q+": Math.floor((date.getMonth() + 3) / 3), //季度
    "S": date.getMilliseconds()             //毫秒
  };
  if (/(y+)/.test(fmt))
    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt))
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}

export default Tools;

