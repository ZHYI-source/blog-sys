<template>
  <section>
    <d2-container type="full" v-if="!show.edit&&!show.view">
      <section class="data-list-box">
        <el-row v-if="showMax">
          <div class="chart-box-max">
            <div class="btnn"><i></i>
              <el-button size="mini" type="success" @click="showMax = false;lineOption.xAxis.axisLabel.rotate='45'">
                关闭大图
              </el-button>
            </div>
            <mk-chart-com :option="lineOption" :key="updataKey+2" height="650px"/>
          </div>
        </el-row>
        <el-row v-if="!showMax">
          <el-col :span="12">
            <mk-search-form :model="query" v-if="permBtn.queryButton" @search="goPage(1)">
              <el-button style="margin-left: 5px" slot="btn" type="primary" size="mini" @click="$emit('close')">返回上一级
              </el-button>
              <el-form-item class="inline-item" prop="id">
                <el-input v-model.trim="query.params.id" @clear="goPage(1)" @keyup.native.enter="goPage(1)"
                          clearable placeholder="输入ID搜索"
                          size="mini"></el-input>
              </el-form-item>

              <el-form-item class="inline-item" prop="axi_x">
                <el-input v-model.trim="query.params.axi_x" @clear="goPage(1)" @keyup.native.enter="goPage(1)"
                          clearable placeholder="输入X轴数据搜索"
                          size="mini"></el-input>
              </el-form-item>

              <el-form-item class="inline-item" prop="axi_y">
                <el-input v-model.trim="query.params.axi_y" @clear="goPage(1)" @keyup.native.enter="goPage(1)"
                          clearable placeholder="输入Y轴数据搜索"
                          size="mini"></el-input>
              </el-form-item>

              <el-form-item class="inline-item" prop="remark">
                <el-input v-model.trim="query.params.remark" @clear="goPage(1)" @keyup.native.enter="goPage(1)"
                          clearable placeholder="输入备注搜索"
                          size="mini"></el-input>
              </el-form-item>
            </mk-search-form>
            <div class="table-operate">
              <table-field-filter :fields="fields" @showChange="updataKey +=1"/>
              <mk-table-button
                dis-delete
                :dis-add="!permBtn.createButton"
                @add="goEdit"
              >
                <div style="display: flex">
                  <el-button size="mini" icon="el-icon-delete" v-if="permBtn.deleteAllButton" @click="deleteAll">清空数据
                  </el-button>
                  <el-button size="mini" icon="el-icon-upload2" @click="exportEcx">导出</el-button>
                  <el-upload
                    class="upload-demo"
                    :data="{pid:query.params.pid}"
                    action="/mg/api/private/analysis/importExcel"
                    :headers="headers"
                    :show-file-list="false"
                    :on-success="handleSuccess"
                    :before-upload="beforeUpload"
                  >
                    <el-button size="mini" icon="el-icon-upload" v-if="permBtn.importButton">导入</el-button>
                  </el-upload>
                  <el-button style="margin-right: 5px" size="mini" icon="el-icon-download" v-if="permBtn.templateButton"
                             @click="downloadTemplate">模板下载
                  </el-button>
                </div>
              </mk-table-button>
            </div>
            <mk-el-table @sort="sortChange" :datas="datas" :key="updataKey" :height="tableHeight"
                         :loadingText="loading.text"
                         :loading="loading.list">
              <template v-for="field in fields" v-if="field.show">
                <el-table-column v-if="field.key=='checkBox'" :align="field.align" type="selection"></el-table-column>
                <el-table-column v-else-if="field.key=='toolButton'" :align="field.align" :label="field.name"
                                 :width="field.width" :fixed="field.fixed">
                  <template slot-scope="scope">
                    <mk-tool-button
                      :dis-delete="!permBtn.deleteButton"
                      :dis-edit="!permBtn.updateButton"
                      @view="goView(scope.row)"
                      @edit="goEdit(scope.row)"
                      @delete="goDelete(scope.row)">
                    </mk-tool-button>
                  </template>
                </el-table-column>
                <el-table-column
                  v-else
                  show-overflow-tooltip
                  :prop="field.key"
                  :align="field.align"
                  :label="field.name"
                  :width="field.width"
                  :sortable="field.enableSort?'custom':false"
                  :fixed="field.fixed"
                ></el-table-column>
              </template>
            </mk-el-table>
            <mk-pagination :current-page="query.offset" :page-size="query.limit"
                           :data-size="temp.dataSize" @go="goPage" @changePageSize="changePageSize"/>
          </el-col>
          <el-col :span="12">
            <el-row>
              <div class="chart-box">
                <div class="btnn"><i></i>
                  <el-button size="mini" type="success" @click="showMax = true;lineOption.xAxis.axisLabel.rotate='0'">
                    查看大图
                  </el-button>
                </div>
                <mk-chart-com :option="lineOption" :key="updataKey+3" height="450px"/>
              </div>
            </el-row>
          </el-col>
        </el-row>
      </section>
    </d2-container>
  </section>
</template>

<script>

import Tools from "@/libs/utils.tool";
import {exportExecl} from "@/libs/util.export";

import {
  analysisDownloadTemplate,
  analysisExportExcel,
  dirAnalysisDelete, dirAnalysisDeleteAll,
  dirAnalysisList
} from "@/api/modules/sys.analysis.api";
import GetAnalysisInfo from "./get-analysis-info";
import ViewAnalysisInfo from "./view-analysis-info";
import util from "@/libs/util";
import MkChartCom from "@/components/common/mk-chart-com";

export default {
  name: 'dir-analysis-info',
  components: {MkChartCom, ViewAnalysisInfo, GetAnalysisInfo,},
  data() {
    return {
      showMax: false,
      //折线图
      lineOption: {
        grid: {
          top: 90
        },
        title: {
          text: 'GST',
          x: 'center',
          y: '20',
          subtext: 'HRLK',
          textVerticalAlign: 'middle',
          subtextStyle: {
            //文字颜色
            color: '#000',
            //字体风格,'normal','italic','oblique'
            fontStyle: 'normal',
            //字体系列
            fontFamily: 'sans-serif',
          },
          textStyle: {
            //文字颜色
            color: '#000',
            //字体风格,'normal','italic','oblique'
            fontStyle: 'normal',
            //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
            fontWeight: 'bold',
            //字体系列
            fontFamily: 'sans-serif',
            //字体大小
            fontSize: 18
          }
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {
          right: '0',
          top: 'center',
          orient: 'vertical',

        },
        toolbox: {
          show: true,
          feature: {
            dataZoom: {
              yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar',]},
            restore: {},
            saveAsImage: {}
          }
        },

        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: [],
          //解决显示X轴不全
          axisLabel: {
            interval: 0,
            rotate: "13",
            textStyle: { // 数值样式
              color: 'black',
              fontSize: 14
            }
          },
        },
        yAxis: {
          type: 'value',
          axisLabel: {
            formatter: '{value}'
          },
          axisLine: {
            show: true,
          },
          //分割线
          splitLine: {
            show: true,
            lineStyle: {
              color: '#FAFBFD'
            }
          },
        },
        series: [
          {
            name: '平均值',
            type: 'line',
            data: [],
            itemStyle: {
              normal: {
                color: "rgb(0,0,0)",
                label: {
                  show: true, // 开启显示
                  position: 'top', // 在上方显示
                  textStyle: { // 数值样式
                    color: 'rgb(0,0,0)',
                    fontSize: 12
                  }
                }
              }
            },
            // markPoint: {
            //   data: [
            //     {type: 'max', name: 'Max'},
            //     {type: 'min', name: 'Min'}
            //   ]
            // },
          },
          {
            name: '标准误',
            type: 'line',
            data: [],
            itemStyle: {
              normal: {
                color: "rgb(184,183,183)",
                label: {
                  show: true, // 开启显示
                  position: 'top', // 在上方显示
                  textStyle: { // 数值样式
                    color: 'rgb(0,0,0)',
                    fontSize: 12
                  }
                }
              }
            },
            // markPoint: {
            //   data: [{type: 'max', name: 'Max'},
            //     {type: 'min', name: 'Min'}]
            // },
          }
        ]
      },
      show: {
        edit: false,
        view: false
      },
      headers: {
        authorization: util.cookies.get('token',)
      },
      type: '',
      updataKey: 0,
      heightL: 580,
      tableHeight: 580,
      //查询条件
      query: {
        params: {
          pid: ''
        },
        limit: 100,//每页显示条数
        offset: 1,//页码
        sort: {
          prop: 'createdAt',
          order: 'desc',
        }
      },
      //返回数据列表
      datas: [],
      //临时变量
      temp: {
        //数据总调数
        dataSize: 0,
        //当前选中的id
        id: '',
        //
        item: []
      },
      //汇总数据
      totals: [],
      //加载中效果
      loading: {
        //获取列表数据中
        list: false,
        text: '加载中'
      },
      permBtn: {
        createButton: false,
        queryButton: false,
        deleteButton: false,
        updateButton: false,
        importButton: false,
        templateButton: false,
        deleteAllButton: false,
      },
      chartInfo: {
        title: '图表'
      },
      item_data: {},
      //列表渲染数据列
      fields: [
        {key: 'toolButton', name: '操作', show: true, align: "center", width: '220', enableSort: false, fixed: 'right'},
        // {key: 'checkBox', name: '全选按钮', show: true, enableSort: false, fixed: false},
        // {key: 'id', name: 'ID', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'axi_x', name: 'GST(X轴)', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'axi_y', name: '平均值', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'axi_y_a', name: '标准误', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'remark', name: '备注', show: true, align: "center", enableSort: false, fixed: false},
        // {key: 'createdAt', name: 'CREATEDAT', show: true, align: "center", enableSort: false, fixed: false},
        // {key: 'updatedAt', name: 'UPDATEDAT', show: true, align: "center", enableSort: false, fixed: false},
      ]
    }
  },
  props: {
    updateData: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  watch: {
    'heightL'(val) {
      this.updataKey += 1
      this.tableHeight = val
    },
  },
  mounted() {
    this.query.params.pid = this.updateData.id
    this.lineOption.title.text = this.updateData.pro_title
    this.lineOption.title.subtext = this.updateData.remark || '-'
    this.getWinHeight()
    this.getDataList()
    this.getPerms()
  },
  methods: {
    getPerms() {
      let perms = JSON.parse(util.cookies.get('permMenus'))
      if (perms.includes('*')) {
        this.permBtn.createButton = true;
        this.permBtn.queryButton = true;
        this.permBtn.deleteButton = true;
        this.permBtn.updateButton = true;
        this.permBtn.importButton = true;
        this.permBtn.templateButton = true;
        this.permBtn.deleteAllButton = true;
      } else {
        if (perms.includes('POST /api/private/analysis/create')) {
          this.permBtn.createButton = true;
        }
        if (perms.includes('POST /api/private/analysis/list')) {
          this.permBtn.queryButton = true;
        }
        if (perms.includes('POST /api/private/analysis/update')) {
          this.permBtn.updateButton = true;
        }
        if (perms.includes('POST /api/private/analysis/delete')) {
          this.permBtn.deleteButton = true;
        }
        if (perms.includes('POST /api/private/analysis/downloadTemplate')) {
          this.permBtn.templateButton = true;
        }
        if (perms.includes('POST /api/private/analysis/importExcel')) {
          this.permBtn.importButton = true;
        }
        if (perms.includes('POST /api/private/analysis/deleteAll')) {
          this.permBtn.deleteAllButton = true;
        }
      }
    },
    //模板下载
    downloadTemplate() {
      analysisDownloadTemplate().then(res => {
        console.log('模板下载成功',)
        window.open(res.url, '_self');
      }).catch(err => {
        console.log('模板下载错误', err)
      })

    },
    beforeUpload(file) {

    },
    handleSuccess(res, file) {
      if (res.meta.status !== 200) return this.$toast.error(res.meta.msg || '上传失败')
      this.$toast.success(res.meta.msg)
      this.getDataList()
    },
    //表格导入
    importEcx() {
    },
    //导出
    exportEcx() {
      analysisExportExcel(this.query).then(res => {
        window.open(res.url, '_self');
      }).catch(err => {
        console.log('导出错误', err)
      })
    },
    //获取窗口高度
    getWinHeight() {
      let that = this
      this.heightL = window.innerHeight - 320
      window.addEventListener('resize', () => {
        that.updataKey += 1
        that.heightL = window.innerHeight - 320
      })
    },
    getDataList(val) {
      try {
        this.loading.list = true;
        dirAnalysisList(this.query).then(res => {
          let datas = res.data || []

          let XData = []
          let YData = {
            avg: [],
            errorD: []
          }
          for (const data of datas) {
            //时间格式化
            data.createdAt = data.createdAt && Tools.fmtLong2DateTime(data.createdAt)
            data.updatedAt = data.updatedAt && Tools.fmtLong2DateTime(data.updatedAt)
            //组建X轴
            XData.push(data.axi_x)
            YData.avg.push(data.axi_y)
            YData.errorD.push(data.axi_y_a)
          }
          this.datas = datas;
          this.lineOption.xAxis.data = XData
          this.lineOption.series[0].data = YData.avg
          this.lineOption.series[1].data = YData.errorD
          this.temp.dataSize = res.count;
          this.updataKey += 3
          this.loading.list = false;
        })
      } catch (err) {
        console.log(err)
        this.$message.error('数据加载失败')
        this.loading.list = false;
      }
    },
    goDelete(data) {
      this.$toast.confirm('此操作将永久删除该条数据, 是否继续?').then(() => {
        dirAnalysisDelete(data.id).then(res => {
          this.$toast.success('删除成功')
          this.getDataList()
        }).catch(err => {
          console.log(err)
        })
      });
    },
    deleteAll(data) {
      this.$toast.confirm('此操作将永久删除, 是否继续?').then(() => {
        dirAnalysisDeleteAll(this.query.params.pid).then(res => {
          this.$toast.success('删除成功')
          this.getDataList()
        }).catch(err => {
          console.log(err)
        })
      });

    },
    close() {
      this.show.edit = false
      this.show.view = false
      this.getDataList()
    },
    //跳到页
    goPage(pageNum) {
      this.query.offset = pageNum
      //查询数据
      this.getDataList();
    },
    //改变每页数据量
    changePageSize(size) {
      this.query.limit = size;
      this.query.offset = 1;
      this.getDataList();
    },
    //重置查询条件
    resetQuery(formName) {
      this.$refs[formName].resetFields();
      this.goPage(1);
    },
    // 排序
    sortChange(row) {
      this.query.sort.order = row.order === 'ascending' ? 'asc' : 'desc'
      this.query.sort.prop = row.prop
      this.getDataList()
    },
    //添加编辑
    goEdit(data) {
      this.$toast.showSmallModal(data && data.id ? '修改' : '增加', GetAnalysisInfo, {updateData: data}, data => {
        if (data) {
          this.getDataList()
        }
      })
    },
    //跳转到查看详情
    goView(data) {
      this.$toast.showSmallModal('查看', ViewAnalysisInfo, {viewData: data || {}}, data => {
        // console.log(data)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.upload-demo {
  margin: 0px 5px;
}

.chart-box {
  .btnn {
    display: flex;
    justify-content: space-between;
    align-content: center;
    margin-bottom: 8px;
  }
}
</style>
