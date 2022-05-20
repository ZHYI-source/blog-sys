<template>
  <view class="music-box">
    <view class="list-ico">
      <u-icon name="list" color="#d7deeb" size="20" @click="openList"></u-icon>
    </view>
    <audio :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
   <view class="music-list" v-if="isList">
     <view v-for="(item, index) in list" :key="index" @click="selectMusic(item)">
       {{ (index + 1)+'.'+ '  '+item.name}}
     </view>
   </view>
  </view>
</template>

<script>
import {dirMusicList} from "../../api/mini.website";

export default {
  name: "music",
  data(){
    return {
      current: {},
      list:[],
      isList:false,
      audioAction: {
        method: 'pause'
      },
    }
  },
  created(){
    this.getData()
  },
  methods:{
    openList(){
      this.isList=!this.isList
    },
    selectMusic(row){
      this.current=row
    },
    getData(){
      dirMusicList().then(res=>{
        for (const objElement of res.data.data) {
          let obj = {
            poster: objElement.cover,
            name: objElement.name,
            author: objElement.author,
            src: objElement.url,
          }
          this.list.push(obj)
        }
        this.current = this.list[0] || {
          poster: 'https://bjetxgzv.cdn.bspapp.com/VKCEYUGU-uni-app-doc/7fbf26a0-4f4a-11eb-b680-7980c8a877b8.png',
          name: '致爱丽丝',
          author: '暂无',
          src: 'https://bjetxgzv.cdn.bspapp.com/VKCEYUGU-hello-uniapp/2cc220e0-c27a-11ea-9dfb-6da8e309e0d8.mp3',
        }
      }).catch(err=>{
        console.log(err)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.music-box {
  position: relative;
  background-color: #fff;
  padding: 15rpx;
  border-radius: 5rpx;
  box-sizing: 0rpx 0rpx 10rpx #8b8989;
  .list-ico {
    position: absolute;
    top: 100rpx;
    right: 20rpx;
  }
}
  .music-list {
    line-height: 26px;
    font-size: 24rpx;
    color: #797979;
    overflow: hidden;
    transition: all .5s linear;
  }
</style>