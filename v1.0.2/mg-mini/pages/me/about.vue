<template>
  <view class="center">
    <!-- 顶部图片 -->
    <view class="about-w">
      <image class="fengrui-img" :src="website.avatar" mode="aspectFit"></image>
    </view>
    <!-- 标题 -->
    <view class="data-h ma-top">
      关于作者
    </view>
    <!-- 标语 -->
    <view class="data-ad-Reading">
      {{website.slogan}}
    </view>
    <view class="data-view">
      <u-grid
          :col="4"
          @click="clickQuick"
          :border="false">
        <u-grid-item
            v-for="(baseListItem,baseListIndex) in baseList"
            :key="baseListIndex"
        >
          <image :src='baseListItem.img' class='quick-logo' mode='aspectFit'></image>
          <text class="grid-text">{{baseListItem.title}}</text>
        </u-grid-item>
      </u-grid>
    </view>
    <view class="data-view">
      <view class="data-font">
        <md-highlight :resource="aboutData.about_content"/>
      </view>
      <u-button type="primary" text="去留言" @click="goMessage()"></u-button>
    </view>
    <!-- 版本说明 -->
    <view class="author">
       作者: @ 书中枫叶 🍁
    </view>
    <u-gap height="30" bgColor="#f2f5f9"></u-gap>
    <u-popup :show="show" :round="10" mode="center" @close="close" @open="open">
      <view class="zs-img">
        <image src='../../static/image/zs.jpg'  mode='aspectFit'></image>
      </view>
    </u-popup>
  </view>
</template>
<script>

import MpHtml from "../../components/mp-html/mp-html";
import {dirAboutList, dirWebsiteList} from "../../api/mini.website";
import MdHighlight from "../../components/cmder-MDParserHighlight";
export default {
  components: {
    MdHighlight,
    MpHtml
  },
  data() {
    return {
      show: false,
      query: {
        //查询推荐并且按是否顶置排序查询
        params: {},
        limit: 10,//每页条数
        offset: 1,//当前页
      },
      baseList: [
        {
          name: 'photo',
          title: '打赏',
          img:'../../static/image/dashang.png'
        },
        {
          name: 'lock',
          title: 'QQ',
          img:'../../static/image/qq.png'
        },
        {
          name: 'star',
          title: '邮箱',
          img:'../../static/image/email.png'
        },
        {
          name: 'star',
          title: 'Gitee',
          img:'../../static/image/gitee.png'
        },

      ],
      aboutData:{},
      website:{},
      // 关于数据
      about_center:'',
      // 文本框解析
      tag_style:{
        h: 'line-height: 50px;',
        h2: 'line-height: 50px;',
        h3: 'line-height: 50px;',
        h4: 'line-height: 50px;',
      },
      container_style:'font-size:15px;border-radius:10px',
    }
  },
  onLoad() {
    // 自定义php接口请求
    this.getDataList();
    this.getWebsite();

    // 微信分享盆友圈
    //#ifdef MP-WEIXIN
    wx.showShareMenu({
      withShareTicket: true,
      menus: ['shareAppMessage', 'shareTimeline']
    })
    //#endif
  },

  // 分享好友配置
  onShareAppMessage(res) {
    var that = this;
    if (res.from === 'button') { // 来自页面内分享按钮
      console.log(res.target)
    }
    return {
      title: 'mg.blog',
      // imageUrl: that.about_center.share_title_url,
      path: 'pages/me/about'
    }
  },

  methods: {
    copyBtn: function(val) {
      uni.setClipboardData({
        data: val,
        success: function () {
          uni.showToast({
            icon:'none',
            title: '复制成功,请到浏览器中打开',
          });
        },
        fail:function () {
          uni.showToast({
            title: '复制失败',
          });
        }
      });
    },
    close() {
      this.show = false
      // console.log('close');
    },
    clickQuick(val){
      var that = this;
      switch (val){
        case 0:
          uni.previewImage({
            current: 1,
            urls: ['http://zhouyi.run:5222/api/public/admin/getFiles?id=8200dbae084c2fe8d9ca53facb5f5e97.jpg&&mimetype=image/jpeg'],
            longPressActions: {
              itemList: ['发送给朋友', '保存图片', '收藏'],
              success: function(data) {
                console.log('选中了第' + (data.tapIndex + 1) + '个按钮,第' + (data.index + 1) + '张图片');
              },
              fail: function(err) {
                console.log(err.errMsg);
              }
            }
          });
          break;
        case 1:
          this.copyBtn('1840354092')
          break;
        case 2:
          this.copyBtn('1840354092@qq.com')
          break;
        case 3:
          this.copyBtn('https://gitee.com/Z568_568')
          break;
      }

    },
    goMessage(){
      uni.navigateTo({
        url: '/pages/message/index'
      });
    },
    getDataList(){
      this.$toast.loading()
      dirAboutList(this.query).then(res=>{
        this.$toast.hideLoading()
        this.aboutData = res.data.data[0]
      }).catch(err=>{
        console.log(err)
      })
    },
    getWebsite(){
      dirWebsiteList().then(res=>{
        this.website = res.data.data[0]
      }).catch(err=>{
        console.log(err)
      })
    },

  }
}
</script>

<style lang="scss" scoped>
/* 版权说明 */
.author{
  font-size: 20upx;
  color: #484848;
  text-align: center;
  color: #a9a8a8;
  margin-bottom: 20px;
}

/* 内容 */
.data-view {
  margin: 48upx 0upx;
  font-size: 28upx;
  color: #333232;
  line-height: 60upx;
  background-color: #FFFFFF;
  border-radius: 20upx;
  padding: 20upx 30upx;
  .data-font {
    margin-bottom: 20px;
    .btn {
      margin: 20px;
    }
  }


}

/* 标语 */
.data-ad-Reading {
  font-size: 24rpx;
  color: #8d9090;
  margin-top: 10upx;
}

/* 标题 */
.ma-top{
  margin-top: 40upx;
}
.data-h {
  color: #000000;
  font-size: 36upx;
  position: relative;
}

/* 顶部图片 */
.about-w{
  height: 320upx;
  width: 100%;
  position: relative;
  border-radius: 20upx;
  overflow: hidden;
  box-shadow: #fce6d2 2UPX 6UPX 12UPX;
  background: #FF5F6D;  /* fallback for old browsers */
  background: -webkit-linear-gradient(to right, #FFC371, #FF5F6D);  /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #FFC371, #FF5F6D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}


/* 全局 */
.center {
  margin: 28upx;
}
.fengrui-img {
  height: 80%;
  width: 80%;
  display: block;
  margin: 15px auto;
}
page {
  background-color: #F7F7F7;
}
.quick-logo {
  width: 80rpx;
  height: 80rpx;
  margin-bottom: 8rpx;
}
.grid-text {
  font-size: 22rpx;
  color: #555454;
  text-align: center;
}
.zs-img {
  border-radius: 10rpx;
  padding: 20px 10px;
  background: #FF5F6D;  /* fallback for old browsers */
  background: -webkit-linear-gradient(to right, #FFC371, #FF5F6D);  /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #FFC371, #FF5F6D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
/* 暗黑模式下应用的样式 */
@media (prefers-color-scheme: dark) {
  page {
    background: #161616;
  }
  .data-view{
    background-color: #202020;
  }
  //.author{
  //  font-size: 20upx;
  //  color: #484848;
  //  text-align: center;
  //  color: rgba(201, 201, 201, 1);
  //}
  .author{
    font-size: 20upx;
    color: #484848;
    text-align: center;
    color: #a9a8a8;
    margin-bottom: 15px;
  }
}
</style>
