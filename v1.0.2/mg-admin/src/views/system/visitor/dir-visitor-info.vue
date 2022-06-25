<template>
  <section>
    <d2-container type="full" v-if="!show.edit&&!show.view">
      <section class="data-list-box">
        <mk-search-form :model="query" v-if="permBtn.queryButton" @search="goPage(1)">
          <el-form-item class="inline-item" prop="ipaddr">
            <el-input v-model.trim="query.params.ipaddr" @clear="goPage(1)" @keyup.native.enter="goPage(1)"
                      clearable placeholder="输入ip搜索"
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
            <el-button size="mini" icon="el-icon-upload" @click="exportEcx">导出</el-button>
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
                <mk-tool-button @view="goView(scope.row)"
                                @edit="goEdit(scope.row)"
                                :dis-delete="!permBtn.deleteButton"
                                :dis-edit="!permBtn.updateButton"
                                @delete="goDelete(scope.row)">
                  <el-button size="mini" v-if="permBtn.resetButton" @click="resetPwd(scope.row)" type="primary">重置密码</el-button>
                </mk-tool-button>
              </template>
            </el-table-column>
            <el-table-column v-else-if="field.key=='type'" :align="field.align"
                             :sortable="field.enableSort?'custom':false" :label="field.name"
                             :width="field.width" :fixed="field.fixed">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.type">管理端</el-tag>
                <el-tag v-else type="warning">前台端</el-tag>
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
      </section>
    </d2-container>
  </section>
</template>

<script>

import Tools from "@/libs/utils.tool";
import {exportExecl} from "@/libs/util.export";

import {dirUsersDelete, dirUsersList, dirUsersReset} from "@/api/modules/sys.users.api";
import {dirVisitorList} from "@/api/modules/sys.visitor.api";
import ViewVisitorInfo from "@/views/system/visitor/view-visitor-info";

export default {
  name: 'dir-visitor-info',
  components: {ViewVisitorInfo},
  data() {
    return {
      show: {
        edit: false,
        view: false,
        reset: false,
      },
      resetPwdData:{
        password:''
      },
      rules: {
        password: [
          {required: true, message: '请输入新密码', trigger: 'blur'},
        ],
      },
      updateData: {},
      type: '',
      updataKey: 0,
      heightL: 600,
      tableHeight: 600,
      //查询条件
      query: {
        params: {},
        limit: 20,//每页显示条数
        offset: 1,//页码
        sort: {
          prop: 'createdAt',
          order: 'desc',
        }
      },
      permBtn: {
        createButton: false,
        queryButton: false,
        deleteButton: false,
        updateButton: false,
        resetButton: false,
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
      item_data: {},
      //列表渲染数据列

      fields: [
        {key: 'toolButton', name: '操作', show: true, align: "center", width: '', enableSort: false, fixed: 'right'},
        {key: 'id', name: 'ID', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'username', name: '用户名', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'browser', name: '浏览器', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'os', name: '操作系统', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'type', name: '项目类型', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'ipaddr', name: 'IP', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'loginLocation', name: '地址', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'count', name: '访问次数', show: true, align: "center", enableSort: false, fixed: false},
        {key: 'createdAt', name: '访问时间', show: true, align: "center", enableSort: false, fixed: false},
        // {key: 'state', name: '状态', show: true, align: "center", enableSort: false, fixed: false},
      ]
    }
  },
  watch: {
    'heightL'(val) {
      this.updataKey += 1
      this.tableHeight = val
    },
  },
  mounted() {
    this.getWinHeight()
    this.getDataList();
    this.getPerms()
  },
  methods: {
    getPerms() {
      let perms = this.$store.state.d2admin.perms.permsArr
      if (perms.includes('*')) {
        this.permBtn.queryButton = true;
      } else {
        if (perms.includes('POST /api/private/visitor/list')) {
          this.permBtn.queryButton = true;
        }

      }
    },
    //导出
    exportEcx() {
      exportExecl(this, this.fields, this.datas, '列表', new Date().toLocaleDateString() + '导出的列表')
    },
    //获取窗口高度
    getWinHeight() {
      let that = this
      this.heightL = window.innerHeight - 310
      window.addEventListener('resize', () => {
        that.updataKey += 1
        that.heightL = window.innerHeight - 310
      })
    },
    getDataList() {
      try {
        this.loading.list = true;
        dirVisitorList(this.query).then(res => {
          let datas = res.data || []
          for (const data of datas) {
            //时间格式化
            data.createdAt = data.createdAt && Tools.fmtLong2DateTime(data.createdAt)
            data.updatedAt = data.updatedAt && Tools.fmtLong2DateTime(data.updatedAt)
          }
          this.datas = datas;
          this.temp.dataSize = res.count;
          this.loading.list = false;
        })
      } catch (err) {
        this.$message.error('数据加载失败')
        this.loading.list = false;
      }
    },
    goDelete(data) {
      this.$toast.confirm('此操作将永久删除该条数据, 是否继续?').then(() => {
        dirUsersDelete(data.id).then(res => {
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
    saveResetPwd(formName){
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.show.reset = false
          dirUsersReset(this.resetPwdData).then(res=>{
            this.$toast.success('重置密码成功')
            this.getDataList()
          }).catch(err=>{
            console.log(err)
            this.$toast.error('重置密码错误')
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetPwd(data) {
      this.show.reset = true
      this.resetPwdData.password=''
      this.resetPwdData.id=data.id
    },
    //添加编辑
    goEdit(data) {
      // this.$toast.showSmallModal(data && data.id ? '修改' : '增加', GetUsersInfo, {updateData: data}, data => {
      //   if (data) {
      //     this.getDataList()
      //   }
      // })
    },
    //跳转到查看详情
    goView(data) {
      this.$toast.showSmallModal('查看访客', ViewVisitorInfo, {viewData: data || {}}, data => {
        // console.log(data)
      })
    }
  }
}
</script>

<style scoped>

</style>
