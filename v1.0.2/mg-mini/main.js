import App from './App'
// #ifndef VUE3
import Vue from 'vue'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
    ...App
})
app.$mount()
// #endif
import uView from "uview-ui";
Vue.use(uView);

import Toast from 'utils/utils.toast'
Vue.prototype.$toast = Toast
import tool from 'utils/utils.tool'
Vue.prototype.$tool = tool
// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif
