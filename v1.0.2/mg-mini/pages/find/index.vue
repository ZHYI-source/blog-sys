<template>
  <view class="content">
    <u-sticky>
      <u-gap height="15" bgColor="#f2f5f9"></u-gap>
      <view class="section slogan">
      <view>{{website.slogan}}</view>
      <view class="search-box">
        <u-search
            placeholder="想看的文章名称"
            clearabled
            v-model="query.params.article_title"
            @clear="goPage(1)"
            @clickIcon="goPage(1)"
            @search="goPage(1)"
            @custom="goPage(1)"
        ></u-search>
      </view>
      </view>
      <u-gap height="15" bgColor="#f2f5f9"></u-gap>
    </u-sticky>
    <view class="section-list">
      <u-empty
          v-if="!dataList.length"
          mode="data"
          icon="http://cdn.uviewui.com/uview/empty/data.png"
      >
      </u-empty>
      <template v-else>
      <view class="section-item" v-for="item in dataList" :key="item.id" @click="goPostDetail(item)">
        <view class='list-logo'>
          <image :src='item.article_cover' style="width: 100%;height: 100%"  mode='scaleToFill'></image>
        </view>
        <view class="list-desc">
          <view class="desc-title"><text class="isTop" v-if="item.isTop">TOP.</text><text class="isTop" v-if="item.isHot">HOT.</text>#{{item.article_title}}</view>
          <view class="desc-com">
            {{item.article_summary}}
          </view>
          <view class="desc-time">
            <u-icon name="clock" size="12"></u-icon>
            <text class="time">{{$tool.fmtLong2DateTime(item.createdAt)}}</text>
          </view>
        </view>
      </view>
      <u-divider text="END" ></u-divider>
      </template>
    </view>
    <u-back-top :scroll-top="scrollTop" icon="arrow-up" mode="circle" :customStyle="customStyles" :iconStyle="iconStyle"></u-back-top>
  </view>
</template>

<script>
import {dirArticle} from "../../api/mini.article";
import {dirWebsiteList} from "../../api/mini.website";

export default {
  data() {
    return {
      iconStyle: {
        fontSize: '28rpx',
        color: '#dd524d'
      },
      customStyles: {
        backgroundColor: 'rgba(246,246,246,0.5)',
      },
      scrollTop: 0,
      title: "MG'blog",
      baseList: [
        {
          name: 'photo',
          title: '搜索',
          img:'../../static/image/ts.png'
        },
        {
          name: 'lock',
          title: '友链',
          img:'../../static/image/flink.png'
        },
        {
          name: 'star',
          title: '留言',
          img:'../../static/image/ew.png'
        },
        {
          name: 'star',
          title: '关于',
          img:'../../static/image/ab_me.png'
        },

      ],
      dataList:[],
      website:{},
      list1: [],
      query: {
        //查询推荐并且按是否顶置排序查询
        params: {
          isRecommend: true,
          article_title:''
        },
        limit: 10,//每页条数
        offset: 1,//当前页
        sort: {
          prop: 'isTop',
          order: 'desc',
        }
      }
    }
  },
  onLoad() {
    this.getDataList()
    this.getWebsite()
  },
  onPageScroll(e) {
    this.scrollTop = e.scrollTop;
  },
  onPullDownRefresh(){
    this.goPage(1)
    this.getWebsite()
    setTimeout(function() {
      uni.stopPullDownRefresh();
    }, 1000);
  },
  onReachBottom(e) {
    this.query.offset+=1
    this.getDataList(true)
  },
  methods: {
    goMore(){
      uni.switchTab({
        url: '/pages/topic/index'
      });
    },
    goFind(){
      uni.switchTab({
        url: '/pages/find/index'
      });
    },
    goMe(){
      uni.switchTab({
        url: '/pages/me/index'
      });
    },
    clickQuick(val){
      switch (val){
        case 0:
          this.goFind()
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          this.goMe()
          break;
      }
    },
    goPage(num){
      this.query.offset=num
      this.getDataList()
    },
    getDataList(isTout){
      this.$toast.loading()
      dirArticle(this.query).then(res=>{
        this.$toast.hideLoading()
        if (!isTout)return this.dataList = res.data.data
        for (const re of res.data.data) {
          this.dataList.push(re)
        }
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
    clickSwiper(idx){
      let id = this.list1[idx].id
      uni.navigateTo({
        url: '/pages/article/mg-article-view?id='+id
      });
    },
    goPostDetail(row){
      uni.navigateTo({
        url: '/pages/article/mg-article-view?id='+row.id
      });
    }
  }
}
</script>

<style lang="scss" scoped>
.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding-top: 20rpx;
}
.section {
  width: 700rpx;
  margin: 0rpx auto;
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 10rpx;
  &-quick {
    height: 250rpx;
    padding: 20rpx;
    .quick-top {
      padding-bottom: 20rpx;
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
    }
    .quick-bottom {
      display: flex;
      justify-content: center;
      align-content: center;
      .bot-right {
        width: 100%;
        padding-top: 10rpx;
      }
    }

  }
  &-list {
    .section-item{
      width: 700rpx;
      margin-bottom: 20rpx;
      box-sizing: border-box;
      background-color: #fff;
      border-radius: 10rpx;
      height: 200rpx;
      padding: 20rpx;
      display: flex;
      justify-content: flex-start;
      align-content: center;

      .list-logo {
        width: 150rpx;
        height: 150rpx;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-content: center;
        border-radius: 50%;
        box-sizing: 0rpx 0rpx 10rpx #636363;
        border: 1rpx solid #eee;
      }
      .list-desc {
        width: calc(100% - 150rpx);
        padding-left: 20rpx;
        font-family: 'monaco', 'Consolas', "Liberation Mono", Courier, monospace;
        .desc-title {
          font-weight: bold;
          font-size: 18px;
          padding-bottom: 14rpx;
          overflow: hidden;
          text-overflow:ellipsis;
          white-space: nowrap;
          .isTop {
            color: #fff;
            //position: absolute;
            //left: 180rpx;
            //top: -25rpx;
            text-shadow: 0rpx 5rpx 15rpx #dec1c1;
            background-color: #d81e06;
            padding: 5rpx 8rpx;
            border-radius: 8rpx;
            margin-right: 5rpx;
            font-size: 22rpx;
          }
        }
        .desc-com {
          font-size: 12px;
          line-height: 30rpx;
          text-indent: 0.5rem;
          height: 60rpx;
          overflow: hidden;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
          color:#999;
        }
        .desc-time {
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
      }

    }
  }
}
.section-header {
  display: flex;
  justify-content: space-between;
  align-content: center;
  width: 100%;
  padding: 0 25rpx;
  .head-left {
    position: relative;
    padding-left: 20rpx;
    font-weight: bold;
    &:before {
      content: '';
      position: absolute;
      left: 0rpx;
      top: 0rpx;
      width: 10rpx;
      height: 100%;
      border-radius: 5rpx;
      background-color: #d81e06;

    }
  }
  .head-right {
    font-size: 12px;
    color: #999;
  }
}
.slogan {
  padding: 30rpx;
  position: relative;
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
  color: #908f8f;
  &:before {
    content: '';
    position: absolute;
    left: 0rpx;
    top: 0rpx;
    width: 10rpx;
    height: 100%;
    border-bottom-left-radius: 10rpx;
    border-top-left-radius: 10rpx;
    background-color: #d81e06;

  }
  .search-box {
    margin-top: 15px;
  }
}



</style>
