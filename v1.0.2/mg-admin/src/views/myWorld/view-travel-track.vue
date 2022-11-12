<template>
  <d2-container>
    <!--    <el-button slot="header" size="mini" @click="$emit('close')">返回上一页</el-button>-->
    <h4 class="bac-title">
      <span @click="$emit('close')">
        <i style="color: #2f74ff" class="el-icon-caret-left"></i> ⛷️{{drawerData.city + ' · ' + drawerData.title + ' · '}}
      详细行程规划
      </span>
    </h4>
    <div class="trace-time-board">
      <el-row :gutter="20">
        <el-col :span="11">
          <div class="time-line-list">
            <el-timeline v-if="travelDetailDataList.length">
              <el-timeline-item v-for="item in travelDetailDataList" :key="item.id" :timestamp="item.planDate"
                                placement="top">
                <el-card>
                  <h4>{{item.city + ' (' + item.duration + '小时) '}}</h4>
                  <p>{{item.planTxt}}</p>
                  <el-row style="display: flex;justify-content: left;align-items: center">
                    费用：￥0.00
                    <el-button style="margin-left: 12px" icon="el-icon-circle-plus-outline" size="mini"
                               @click="goEditBudget({...item,allBudget: drawerData.budget})">cost
                    </el-button>
<!--                    <el-button icon="el-icon-circle-plus-outline" size="mini" @click="goEditBudget(item)">edit-cost-->
<!--                    </el-button>-->
                  </el-row>
                  <p>提交于 {{item.createdAt}}</p>
                  <el-row style="display: flex;justify-content: right">
                    <el-button icon="el-icon-delete" size="mini" circle @click="goDelete(item)"></el-button>
                    <el-button icon="el-icon-edit" size="mini" circle @click="addTravelDetail(item)"></el-button>
                  </el-row>
                </el-card>
              </el-timeline-item>
              <el-timeline-item placement="top">
                <el-button size="mini" @click="addTravelDetail(null)">添加行程</el-button>
              </el-timeline-item>
            </el-timeline>
            <el-empty v-else description="暂无行程">
              <el-button size="mini" @click="addTravelDetail(null)">添加行程</el-button>
            </el-empty>

          </div>
        </el-col>
        <el-col :span="13">
          <div class="grid-content bg-purple-light">
            <mk-map :key="key" show-btn :coordinateArr="coordinateArr"/>
          </div>
        </el-col>
      </el-row>
    </div>
    <el-row :gutter="20">
      <el-col :span="12">
        <div class="bg-c">
          <h4>⛷️本趟旅程景点耗时统计</h4>
          <div class="head-card">
            <mk-chart-com :key="key + 1" :option="option"/>
          </div>
        </div>
      </el-col>
      <el-col :span="12">
        <div class="bg-c">
          <h4>⛷️本趟旅程花费统计</h4>
          <div class="head-card">
            <mk-chart-com id="costChart" :key="key + 1" :option="costOption"/>
          </div>
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="20" style="margin-top: 20px">
      <el-col :span="24">
        <div class="bg-c">
          <h4>⛷️旅游回忆记录
            <el-button size="mini" @click="editMemoir">{{show.memoir?'关闭':'编辑'}}</el-button>
          </h4>
          <div class="head-card">
            <mk-md-editor v-if="!show.memoir" v-model="travelDetailData.memoirTxt" mode="preview"/>
            <div v-else>
              <mk-md-editor v-model="memoirForm.memoirTxt"/>
              <el-button style="margin-top: 10px" size="mini" @click="confirmMemoir">保存</el-button>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="20" style="margin-top: 20px">
      <el-col :span="24">
        <div class="bg-c">
          <h4>⛷️旅游照片</h4>
          <el-upload size="mini"
                     :headers=headers
                     :show-file-list="false"
                     :on-success="handleSuccess"
                     :before-upload="beforeUpload"
                     :action="action"
          >
            <el-button size="mini">点击上传</el-button>
          </el-upload>
          <div class="head-card">
            <el-image
              v-for="(item,index) in imgs"
              :key="index"
              style="width: 100px; height: 100px;margin: 8px;border-radius: 5px"
              :src="item"
              :preview-src-list="[item]">
            </el-image>
          </div>
        </div>
      </el-col>
    </el-row>

  </d2-container>
</template>

<script>
  import MkBackList from "@/components/common/mk-back-list";
  import MkChartCom from "@/components/common/mk-chart-com";
  import D2ContainerCard from "@/components/d2-container/components/d2-container-card";
  import D2ContainerCardBs from "@/components/d2-container/components/d2-container-card-bs";
  import MkMap from "@/components/common/mk-map";
  import MkMdEditor from "@/components/md-editor/index";
  import {
    dirTravelCreate,
    dirTravelDelete, dirTravelDeleteDetail,
    dirTravelFindOne,
    dirTravelListDetail,
    dirTravelUpdate
  } from "@/api/modules/sys.travel.api";
  import util from "@/libs/util";
  import GetTravelDetail from "@/views/myWorld/get-travel-detail";
  import GetTravelPlace from "@/views/myWorld/get-travel-place";
  import Tools from "@/libs/utils.tool";
  import GetTravelBudget from "@/views/myWorld/get-travel-budget";

  export default {
    name: "view-travel-track",
    components: {GetTravelDetail, MkMdEditor, MkMap, D2ContainerCardBs, D2ContainerCard, MkChartCom, MkBackList},
    props: {
      //单条行程信息
      drawerData: {
        type: Object,
        default() {
          return {}
        }
      }
    },
    created() {
      this.getSingTravel()
      this.getTravelList()
    },
    mounted() {
      // console.log(this.drawerData)

    },
    data() {
      return {
        imgs: [],
        action: `${process.env.VUE_APP_API}/api/private/upload`,
        headers: {
          authorization: util.cookies.get('token',)
        },
        tempImg: '',
        fileList: [],
        show: {
          memoir: false
        },
        memoirForm: {
          memoirTxt: ''
        },
        form: {},
        coordinateArr: [],
        //查询条件
        query: {
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
        key: 1,
        travelDetailData: {},
        travelDetailDataList: [],
        costOption: {
          tooltip: {
            trigger: 'item',
            label: {
              alignTo: 'edge',
              formatter: '{name|{b}}\n{time|{c} 小时}',
              minMargin: 5,
              edgeDistance: 10,
              lineHeight: 25,
              rich: {
                time: {
                  fontSize: 10,
                  color: '#999'
                }
              }
            },
          },
          legend: {
            // show:false,
            // orient: 'vertical',
            left: 'left',
            top: 25
          },
          series: [
            {
              name: '',
              type: 'pie',
              top: 85,
              radius: '70%',
              label: {
                alignTo: 'edge',
                formatter: '{name|{b}}\n{time|{c} 小时}',
                minMargin: 5,
                edgeDistance: 10,
                lineHeight: 25,
                rich: {
                  time: {
                    fontSize: 10,
                    color: '#999'
                  }
                }
              },
              labelLine: {
                length: 15,
                length2: 0,
                maxSurfaceAngle: 30
              },
              labelLayout: function (params) {
                const isLeft = params.labelRect.x < 300 / 2;
                const points = params.labelLinePoints;
                // Update the end point.
                points[2][0] = isLeft
                  ? params.labelRect.x
                  : params.labelRect.x + params.labelRect.width;
                return {
                  labelLinePoints: points
                };
              },
              data: [],
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        },
        option: {
          // title: {
          //   text: '旅程地点耗时',
          //   left: 'center',
          //   top: -5,
          //   textStyle: {
          //     color: '#999',
          //     fontWeight: 'normal',
          //     fontSize: 14
          //   }
          // },
          tooltip: {
            trigger: 'item',
            label: {
              alignTo: 'edge',
              formatter: '{name|{b}}\n{time|{c} 小时}',
              minMargin: 5,
              edgeDistance: 10,
              lineHeight: 25,
              rich: {
                time: {
                  fontSize: 10,
                  color: '#999'
                }
              }
            },
          },
          legend: {
            // show:false,
            // orient: 'vertical',
            left: 'left',
            top: 25
          },
          series: [
            {
              name: '',
              type: 'pie',
              top: 85,
              radius: '70%',
              label: {
                alignTo: 'edge',
                formatter: '{name|{b}}\n{time|{c} 小时}',
                minMargin: 5,
                edgeDistance: 10,
                lineHeight: 25,
                rich: {
                  time: {
                    fontSize: 10,
                    color: '#999'
                  }
                }
              },
              labelLine: {
                length: 15,
                length2: 0,
                maxSurfaceAngle: 30
              },
              labelLayout: function (params) {
                const isLeft = params.labelRect.x < 300 / 2;
                const points = params.labelLinePoints;
                // Update the end point.
                points[2][0] = isLeft
                  ? params.labelRect.x
                  : params.labelRect.x + params.labelRect.width;
                return {
                  labelLinePoints: points
                };
              },
              data: [],
              emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              }
            }
          ]
        }
      }
    },

    methods: {
      getTravelList() {
        this.query.params.travel_id = this.drawerData.id
        dirTravelListDetail(this.query).then(res => {
          let datas = res.data || []
          let placeAnalysis = []
          for (const data of datas) {
            //时间格式化
            data.createdAt = data.createdAt && Tools.fmtLong2DateTime(data.createdAt)
            data.updatedAt = data.updatedAt && Tools.fmtLong2DateTime(data.updatedAt)
            let obj = {name: data.city, value: Number(data.duration)}
            placeAnalysis.push(obj)
          }
          this.option.series[0].data = placeAnalysis
          this.costOption.series[0].data = placeAnalysis
          this.travelDetailDataList = datas
          this.coordinateArr = datas
          this.key += 1
        }).catch(err => {
          console.log(err)
        })
      },

      // 添加行程计划
      addTravelDetail(data) {
        this.$toast.showSmallModal(data?.id ? '修改行程' : '添加行程', GetTravelDetail, {
          updateData: data ? data : {
            add: true,
            id: this.drawerData.id
          }
        }, data => {
          if (data) {
            this.getTravelList()
          }
        })
      },
      //添加旅游地点消费预算
      goEditBudget(data) {
        console.log(data)
        this.$toast.showSmallModal(data?.id ? '修改旅游预算' : '添加旅游预算', GetTravelBudget, {updateData: data || {}}, data => {
          if (data) {
            this.getTravelList()
          }
        })
      },
      goDelete(data) {
        this.$toast.confirm('此操作将永久删除该条数据, 是否继续?').then(() => {
          dirTravelDeleteDetail(data.id).then(res => {
            this.drawer = false
            this.$toast.success('删除成功')
            this.getTravelList()
          }).catch(err => {
            console.log(err)
          })
        });

      },
      //获取单条行程数据
      getSingTravel() {
        dirTravelFindOne({
          params: {
            id: this.drawerData.id
          }
        }).then(res => {
          this.travelDetailData = res || {}
          this.imgs = res.memoirImgs ? res.memoirImgs.split(',') : []
        }).catch(err => {
          console.log(err)
        })
      },
      beforeUpload(file) {
        const isLt2M = file.size / 1024 / 1024 < 20;
        if (!(file.type === 'image/png' || file.type === 'image/gif' || file.type === 'image/jpg' || file.type === 'image/webp' || file.type === 'image/jpeg')) {
          this.$message.error('请上传格式为image/png, image/gif, image/jpg, image/jpeg,image/webp的图片');
          return false
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 20MB!');
        }
        return isLt2M;
      },
      handleSuccess(res, file) {
        this.tempImg = res.data.url
        //  执行更新
        this.memoirForm.id = this.drawerData.id
        let a = this.travelDetailData.memoirImgs + ',' + res.data.url
        this.memoirForm.memoirImgs = this.travelDetailData.memoirImgs ? a : res.data.url

        dirTravelUpdate(this.memoirForm).then(res => {
          this.$toast.success('添加成功！')
          this.getSingTravel()
        }).catch(err => {
          console.log(err)
        })
      },
      //编辑回忆录
      editMemoir() {
        this.show.memoir = !this.show.memoir
      },
      // 确认编辑
      confirmMemoir() {
        // this.memoirForm.date = this.memoirForm.date.toString()
        this.memoirForm.id = this.drawerData.id
        dirTravelUpdate(this.memoirForm).then(res => {
          this.show.memoir = false
          this.$toast.success('添加成功！')
          this.getSingTravel()
        }).catch(err => {
          console.log(err)
        })
      },
    },
  }
</script>

<style lang="scss" scoped>
  .bac-title {
    cursor: pointer;

    &:hover {
      color: #42b983;
    }
  }

  .trace-time-board {
    height: calc(100vh - 280px);
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 20px;
    background-color: #f6f6f6;

    .time-line-list {
      height: calc(100vh - 270px);
      padding: 20px 20px 20px 0;
      overflow: auto;
      box-sizing: border-box;
    }
  }

  .bg-c {
    background-color: #f6f6f6;
    border-radius: 15px;
    padding: 20px;
  }
</style>
