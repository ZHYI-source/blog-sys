//<!-- 页面路径：store/index.js -->
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);//vue的插件机制

//Vuex.Store 构造器选项
const store = new Vuex.Store({
	state: {//存放状态
		"username": "foo",
		"age": 18,
		count: 1
	},
	mutations: {
		add(state) {
			// 变更状态
			state.count += 2
			console.log(state.count)
		}
	}
})
export default store
