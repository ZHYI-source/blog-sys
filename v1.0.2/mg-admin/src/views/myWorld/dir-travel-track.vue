<template>
  <section>
    <d2-container v-if="!show.view">
      <template slot="header">🕺🕺🕺每一个走过的地方都是值得被记录!</template>
      <mk-map
        :key="key"
        v-loading="loading.list"
        :coordinateArr="coordinateArr"
        @markerClick="markerClick"
      >
        <el-button style="margin: 15px" size="mini" icon="el-icon-circle-plus-outline" type="primary"
                   @click="goEdit({})">添加城市
        </el-button>
      </mk-map>
      <el-drawer
        size="30%"
        :visible.sync="drawer"
        :with-header="false">
        <div class="teavel-contain">
          <div class="contain-item">
            <h1>旅游概览</h1>
            <el-divider></el-divider>
            <div class="head-card">
              <el-image class="art-img" fit="cover "
                        :src="drawerData.img || 'https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg'"></el-image>
              <div class="head-title">
                <span>{{drawerData.city}}</span>
                <span>{{drawerData.title}}</span>
                <el-button type="warning" @click="goView">查看详细行程计划</el-button>
              </div>
            </div>
          </div>
          <div>
            <h4>旅游时间</h4>
            <el-divider></el-divider>
            <div class="head-card">
              <el-calendar v-model="value">
                <template
                  slot="dateCell"
                  slot-scope="{date, data}">
                  <!--自定义内容-->
                  <div>
                    <div class="calendar-day">{{ data.day.split('-').slice(2).join('-') }}</div>
                    <div v-for="item in calendarData">
                      <div v-if="(item.months).indexOf(data.day.split('-').slice(1)[0])!=-1">
                        <div v-if="(item.days).indexOf(data.day.split('-').slice(2).join('-'))!=-1">
                          <el-tooltip class="item" effect="dark" :content="item.things" placement="top">
                            <div class="is-selected" @click="viewDate(date,item)"><i class="el-icon-success"></i></div>
                          </el-tooltip>
                        </div>
                        <div v-else></div>
                      </div>
                      <div v-else></div>
                    </div>
                  </div>
                </template>
              </el-calendar>
            </div>
          </div>
          <el-button style="margin: 15px" size="mini" type="primary" @click="goEdit(drawerData)">修改</el-button>
          <el-button style="margin: 15px" size="mini" type="danger" @click="goDelete(drawerData)">删除</el-button>
        </div>
      </el-drawer>
    </d2-container>
    <view-travel-track v-if="show.view" :drawerData='drawerData' @close="close"/>
  </section>
</template>

<script>
  import MkMap from "@/components/common/mk-map";
  import D2ContainerCard from "@/components/d2-container/components/d2-container-card";
  import MkChart from "@/components/common/mk-chart";
  import MkChartCom from "@/components/common/mk-chart-com";
  import ViewTravelTrack from "@/views/myWorld/view-travel-track";
  import GetTravelPlace from "@/views/myWorld/get-travel-place";
  import {dirTravelDelete, dirTravelList, dirTravelListDetail} from "@/api/modules/sys.travel.api";
  import Tools from "@/libs/utils.tool";
  import GetTravelBudget from "@/views/myWorld/get-travel-budget";

  export default {
    name: 'dir-travel-track',
    components: {GetTravelBudget, GetTravelPlace, ViewTravelTrack, MkChartCom, MkChart, D2ContainerCard, MkMap},
    data() {
      return {
        show: {
          view: false,
        },
        //加载中效果
        loading: {
          //获取列表数据中
          list: false,
          text: '加载中'
        },
        key: 1,
        //查询条件
        query: {
          params: {},
          limit: 255,//每页显示条数
          offset: 1,//页码
          sort: {
            prop: 'createdAt',
            order: 'asc',
          }
        },
        queryTravelDate: {
          params: {
            travel_id: ''
          },
          limit: 255,//每页显示条数
          offset: 1,//页码
          sort: {
            prop: 'planDate',
            order: 'asc',
          }
        },
        calendarData: [],
        value: new Date(),
        drawer: false,
        drawerData: {},
        coordinateArr: [],

      }
    },
    created() {
      this.getDataList()
    },
    mounted() {

    },
    methods: {
      getTravelList(id) {
        this.queryTravelDate.params.travel_id = id
        dirTravelListDetail(this.queryTravelDate).then(res => {
          let datas = res.data || []
          this.value = datas.length > 0 ? datas[0].planDate : new Date()
          let arr = []
          for (const data of datas) {
            //时间格式化
            data.createdAt = data.createdAt && Tools.fmtLong2DateTime(data.createdAt)
            data.updatedAt = data.updatedAt && Tools.fmtLong2DateTime(data.updatedAt)
            // 渲染日历数据
            let obj = {months: [], days: [], things: this.drawerData.city + '-' + data.city}
            obj.months = data.planDate.slice(5, 7)
            obj.days = data.planDate.slice(8)
            arr.push(obj)
          }
          this.calendarData = arr
        }).catch(err => {
          console.log(err)
        })
      },
      // 标注点点击回调
      markerClick(ev) {
        this.drawer = true
        this.drawerData = ev.geometry.properties || {}
        //处理日历时间
        // this.drawerData.date = this.drawerData.date.split(',')

        this.getTravelList(ev.geometry.properties.id)
      },
      viewDate(date, data) {
        console.log(date, data)
      },
      //查看详细行程计划
      goView() {
        this.show.view = true
      },
      close() {
        this.show.view = false
      },
      getDataList() {
        try {
          this.loading.list = true;
          dirTravelList(this.query).then(res => {
            let datas = res.data || []
            for (const data of datas) {
              //时间格式化
              data.createdAt = data.createdAt && Tools.fmtLong2DateTime(data.createdAt)
              data.updatedAt = data.updatedAt && Tools.fmtLong2DateTime(data.updatedAt)
            }
            this.coordinateArr = datas;
            this.key += 1
            this.loading.list = false;
          })
        } catch (err) {
          this.$message.error('数据加载失败')
          this.loading.list = false;
        }
      },
      //添加旅游地点
      goEdit(data) {
        this.drawer = false
        this.$toast.showSmallModal(data?.id ? '修改旅游地点' : '添加旅游地点', GetTravelPlace, {updateData: data || {}}, data => {
          if (data) {
            this.getDataList()
          }
        })
      },
      goDelete(data) {
        this.$toast.confirm('此操作将永久删除该条数据, 是否继续?').then(() => {
          dirTravelDelete(data.id).then(res => {
            this.drawer = false
            this.$toast.success('删除成功')
            this.getDataList()
          }).catch(err => {
            console.log(err)
          })
        });

      },
    }
  }
</script>

<style lang="scss" scoped>
  .head-bg {
    width: 100%;
    height: 200px;
    background-position: center;
  }

  .teavel-contain {
    padding: 15px;

    .contain-item {
      cursor: pointer;
    }

    .head-card {
      position: relative;

      .art-img {
        border-radius: 20px;
        height: 200px;
        width: 100%;
        display: inline-block;
        box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)
      }

      .head-title {
        position: absolute;
        left: 50px;
        top: 50%;
        transform: translateY(-50%);
        display: flex;
        flex-direction: column;

        span {
          font-weight: bolder;
          font-size: 30px;
          line-height: 50px;
          font-family: "Ubuntu", Tahoma, "Helvetica Neue", Helvetica, Arial, sans-serif;
          color: #fff;
        }
      }
    }

    .is-selected {
      text-align: center;
      font-size: 25px;
      color: #b273ef;
      line-height: 50px;
    }

  }
</style>
