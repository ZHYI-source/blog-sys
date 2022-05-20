<template>
    <view class="content">
     
      <view class="post-head">
        <view class="post-title">#{{post.article_title}}</view>
        <view>
          <view class="post-time">
            <u-icon name="clock" size="12"></u-icon>
            <text class="time">{{$tool.fmtLong2DateTime(post.createdAt)}}</text>
          </view>
          <view class="post-time">
            <view style="margin-right: 10rpx" v-for="item in post.tags" :key="item.tagId">
              <u-tag :text="item.name" size="mini" type="warning" icon="tags-fill"></u-tag>
            </view>
          </view>
        </view>
      </view>
      <u-line dashed></u-line>
      <view class="post-body">
        <image :src='post.article_cover' style="width: 100%;height: 200rpx;border-radius: 10rpx;margin-bottom: 15rpx"  mode='aspectFill'></image>
<!--        <u-parse v-if="post.editType=='mce'" :content="post.article_content"></u-parse>-->
        <md-highlight v-if="post.editType=='md'" :resource="post.article_content"/>
        <mp-html v-else :tag-style="tag_style" :content="post.article_content" :container-style="container_style"
                 selectable="true"> 内容疯狂加载ing...</mp-html>
      </view>
      <u-line dashed></u-line>
      <view class="post-desc">
        <view class="post-time">
            <u-tag :text="post.cate.name" size="mini" icon="grid-fill" @click="goSort(post.cate)"></u-tag>
        </view>
        <view class="post-time">
          <u-icon name="eye-fill" size="12"></u-icon>
          <text class="time">阅读：{{post.viewsCount}}</text>
        </view>
        <view class="post-time">
          <u-icon name="edit-pen-fill" size="12"></u-icon>
          <text class="time">评论：{{post.commentsCount}}</text>
        </view>
      </view>
      <view class="comment">
        <u-empty
            text="评论暂未开放"
            mode="data"
            icon="http://cdn.uviewui.com/uview/empty/data.png"
        >
        </u-empty>
      </view>
      <u-back-top :scroll-top="scrollTop" :customStyle="customStyles" icon="arrow-up" mode="circle"  :iconStyle="iconStyle"></u-back-top>
    </view>
</template>

<script>
import {dirArticle, getArticleDetail} from "../../api/mini.article";
import MdHighlight from "../../components/cmder-MDParserHighlight";
import MpHtml from "../../components/mp-html/mp-html";

export default {
  name: "mg-article-view",
  components: {MpHtml, MdHighlight},
  data(){
    return {
      scrollTop: 0,
      iconStyle: {
        fontSize: '28rpx',
        color: '#dd524d'
      },
      customStyles: {
        backgroundColor: 'rgba(246,246,246,0.5)',
      },
      // 文本框解析
      tag_style: {
        h1: 'line-height: 50px;font-size:16px;',
        h2: 'line-height: 50px;font-size:16px',
        h3: 'line-height: 50px;font-size:16px',
        h4: 'line-height: 50px;font-size:16px',
      },
      container_style: 'font-size:14px;line-height: 26px;overflow-x: hidden;',
      post:{},
      query:{
        params:{
          id:''
        }
      }
    }
  },
  onLoad(opt) {
    this.getDataList(opt.id)
  },
  // 分享好友配置
  onShareAppMessage(res) {
    let that = this;
    if (res.from === 'button') { // 来自页面内分享按钮
      console.log(res.target)
    }
    return {
      title: that.website.name,
      path: 'pages/index/index'
    }
  },
  onPageScroll(e) {
    this.scrollTop = e.scrollTop;
  },
  methods:{
    getDataList(id){
      this.$toast.loading()
      getArticleDetail(id).then(res=>{
        this.$toast.hideLoading()
        console.log(res)
        this.post=res.data|| {}
        // 正则添加class
        this.post.article_content = res.data.article_content
            .replace(/<h1([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h1')
            .replace(/<h1([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h1')
            .replace(/<h1>/ig, '<h1 class="h1">')

            .replace(/<h2([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h2')
            .replace(/<h2([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h2')
            .replace(/<h2>/ig, '<h2 class="h2">')

            .replace(/<h3([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h3')
            .replace(/<h3([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h3')
            .replace(/<h3>/ig, '<h3 class="h3">')

            .replace(/<h4([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h4')
            .replace(/<h4([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h4')
            .replace(/<h4>/ig, '<h4 class="h4">')

            .replace(/<h5([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h5')
            .replace(/<h5([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h5')
            .replace(/<h5>/ig, '<h5 class="h4">')

            .replace(/<h6([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<h6')
            .replace(/<h6([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<h6')
            .replace(/<h6>/ig, '<h6 class="h6">')

            .replace(/<code([\s\w"=\/\.:;]+)((?:(style="[^"]+")))/ig, '<code')
            .replace(/<code([\s\w"=\/\.:;]+)((?:(class="[^"]+")))/ig, '<code')
            .replace(/<code>/ig, '<code class="language-css">')
      }).catch(err=>{
        console.log(err)
      })
    },
    goSort(cate){
      let id = cate.cateId
      let name = cate.name
      uni.navigateTo({
        url: '/pages/article/mg-article-list?cateId='+id+'&&cateName='+name
      });
    }
  }
}
</script>

<style lang="scss" scoped>
.content {
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  width: 100vw;
  padding: 20rpx;
  background-color: #fff;
  .post-head {
    width: 100%;
    margin-bottom: 15rpx;
    padding-bottom: 20rpx;
    .post-title {
      font-family: 'monaco', 'Consolas', "Liberation Mono", Courier, monospace;
        font-weight: bold;
        font-size: 22px;
        padding-bottom: 14rpx;
    }
  }
  .post-time {
    padding-top: 15rpx;
    color:#999;
    font-size: 12px;
    display: flex;
    justify-content: flex-start;
    align-content: center;
    .time {
      padding-left: 8rpx;
    }
  }
  .post-body {
    width: 100%;
    padding-top: 20px;
    font-family: miranafont, "Hiragino Sans GB", STXihei, "Microsoft YaHei", SimSun, sans-serif;
    //letter-spacing: 1px;
    //color: #535353;
  }
  .post-desc {
    display: flex;
    justify-content: flex-start;
    padding: 30rpx 10rpx;
    .post-time {
      padding-right: 20rpx;
    }
  }
}
</style>