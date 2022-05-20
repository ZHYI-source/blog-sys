<template>
  <view class="content">
      <view class="section section-bord" >
        <view class="se-title">内容分类</view>
        <u-line dashed style="margin: 20rpx 0"></u-line>
        <u-grid
            :border="false"
            @click="clickQuick"
        >
          <u-grid-item
              v-for="(baseListItem,baseListIndex) in cateList"
              :key="baseListIndex"
          >
            <u-icon
                :customStyle="{paddingTop:20+'rpx'}"
                name="star-fill"
                color="#d81e06"
                :size="24"
            ></u-icon>
            <text class="grid-text">{{baseListItem.sort_name}}</text>
          </u-grid-item>
        </u-grid>
      </view>
    <u-gap height="15" bgColor="#f2f5f9"></u-gap>
    <view class="section section-bord" >
      <view class="se-title">标签云</view>
      <u-line dashed style="margin: 20rpx 0"></u-line>
      <view class="tags-box">
        <view  class="tags-item"
               :style="{'background-color':item.color}"
               v-for="item in tagsList"
               :key="item.id">
          {{item.tag_name}}
        </view>
      </view>
    </view>
    <u-gap height="15" bgColor="#f2f5f9"></u-gap>
    <music/>

  </view>
</template>

<script>
  import {dirTagsList, dirWebsiteList} from "../../api/mini.website";
import {dirCateList} from "../../api/mini.cate";
import Music from "../music";


export default {
  components: {  Music},
  data() {
    return {

      iconStyle: {
        fontSize: '28rpx',
        color: '#dd524d'
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
      cateList:[],
      tagsList:[],
      website:{},
      list1: [],
      query: {
        //查询推荐并且按是否顶置排序查询
        params: {},
        limit: 10,//每页条数
        offset: 1,//当前页
      }
    }
  },
  onLoad() {
    this.getDataList()
    this.getWebsite()
  },
  onShow(){
    this.getTagsList()
  },
  onPageScroll(e) {
    this.scrollTop = e.scrollTop;
  },
  methods: {
     randomColor(){
       let r = Math.floor(Math.random()*255);
       let g = Math.floor(Math.random()*255);
       let b = Math.floor(Math.random()*255);
       console.log('rgba('+ r +','+ g +','+ b +',0.8)')
       return 'rgba('+ r +','+ g +','+ b +',0.8)';
},
    clickQuick(val){
      let id = this.cateList[val].id
      let name = this.cateList[val].sort_name
      uni.navigateTo({
        url: '/pages/article/mg-article-list?cateId='+id+'&&cateName='+name
      });
    },
    goPage(num){
      this.query.offset=num
      this.getDataList()
    },
    getDataList(){
      this.$toast.loading()
      dirCateList(this.query).then(res=>{
        this.$toast.hideLoading()
        this.cateList = res.data.data
      }).catch(err=>{
        console.log(err)
      })
    },
    getTagsList(){
      dirTagsList().then(res=>{

        for (const argument of res.data.data) {
          argument.color = this.randomColor()
        }
        this.tagsList=res.data.data
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
.se-title {
  margin-bottom: 20rpx;
  border-left: 10rpx solid #d81e06;
  border-radius: 5rpx;
  padding-left: 10rpx;
  font-weight: bold;
}
.section {
  width: 700rpx;
  margin: 0 rpx auto;
  box-sizing: border-box;
  background-color: #fff;
  border-radius: 10rpx;
  &-bord {
    padding: 20rpx;
    .tags-box {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      padding: 20px 0;
      .tags-item {
        padding: 5px;
        border-radius: 5px;
        color: #0c0c0c;
        text-shadow: 0rpx 0rpx 15rpx #fff;
        font-size: 26rpx;
        font-family: 'monaco', 'Consolas', "Liberation Mono", Courier, monospace;
        margin: 3px;

      }
    }
  }
}
</style>
