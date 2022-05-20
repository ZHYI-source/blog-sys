<template>
	<view>
		<Parser class="parse" :tag-style="tagStyle"   selectable :html="inputHTML" show-with-animation>
			<view class="loading">
				<view class="loading_wrap">
					<image class="image" src="./assets/loading.gif">
					<text>加载中...</text>
				</view>
			</view>
		</Parser>
	</view>
</template>

<script>
	import marked from './assets/marked.min.js';
	import hljs from './highlight.js';
	import Parser from "./parser/parser.vue";
	
	export default {
	  name:'md-highlight',
		props:{
			resource:{
				type:String,
				default:"**请输入markdown内容**"
			}
		},
		components:{
			Parser
		},
		data() {
			return {
				tagStyle: {
				    // 代码块
				    pre: 'overflow: auto;background: #f5f5f5;padding: 20rpx;white-space: pre;border-radius: 8rpx; margin: 20rpx 0;',
				},
			}
		},
		computed:{
			inputHTML(){
				return marked(this.resource);
			}
		},
		created(){
			// 初始化markdown高亮效果
			this.initHighLight();
		},

		methods: {
			initHighLight(){
				hljs.configure({useBR: true,tabReplace:' '});

				marked.setOptions({
					renderer: new marked.Renderer(),
					gfm: true,
					tables: true,
					breaks: false,
					pedantic: false,
					highlight: function (code, lang) {
            console.log(new marked.Renderer(),'*******')
						if (lang && hljs.getLanguage(lang)) {
							// TODO 代码块 使其高亮
							return hljs.highlight(lang, code, true).value;
						} else {
							return hljs.highlightAuto(code).value;
						}
					}
				});
			},
		}
	}
</script>

<style lang="scss">
	@import url('./highlight.js/styles/nnfx.css');
	@import url('./assets/default.css');
</style>
