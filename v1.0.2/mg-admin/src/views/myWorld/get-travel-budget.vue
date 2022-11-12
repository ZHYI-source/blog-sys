<template>
  <section>
    <section class="mk-add-pop">
      <el-form ref="formAdd" :model="form" :rules="rules" label-width="100px">
        <mk-get-row>
          <el-form-item label="总预算">
            <el-tag>{{'￥'+form.allBudget}}</el-tag>
          </el-form-item>
          <el-form-item label="行程站点">
            <el-tag>{{form.city}}</el-tag>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="费用预览">
            <div v-for="(item,index) in costAll" :key="index">
              <el-tag>{{'('+item.label+') '+item.things+' * '+item.num+' = '+item.atm+'元'}}</el-tag>
            </div>
          </el-form-item>
        </mk-get-row>
        <div style="border: 1px solid #eee;padding: 10px;border-radius: 8px">
          <mk-get-row>
            <el-form-item label="消费项目" prop="things">
              <el-input v-model="form.things" size="mini" class="input-one" clearable placeholder="请输入消费项目"></el-input>
            </el-form-item>
            <el-form-item label="消费类型" prop="type">
              <el-select v-model="form.type" size="mini" class="input-one" clearable placeholder="请选择消费类型">
                <el-option v-for="item in options"
                           :key="item.value"
                           :label="item.label"
                           :value="item.value"></el-option>
              </el-select>
            </el-form-item>
          </mk-get-row>
          <mk-get-row>
            <el-form-item label="数量" prop="num">
              <el-input v-model="form.num" size="mini" class="input-one" clearable placeholder="请输入数量">
              </el-input>
            </el-form-item>
            <el-form-item label="消费金额" prop="atm">
              <el-input v-model="form.atm" size="mini" class="input-one" clearable placeholder="请输入消费金额">
              </el-input>
            </el-form-item>
          </mk-get-row>
          <mk-get-row>
            <el-form-item label="">
              <el-button size="mini" @click="addCostList(form)">添加</el-button>
            </el-form-item>
          </mk-get-row>
        </div>
        <el-divider/>
        <mk-get-button @save="save" @close="close(true)"/>
      </el-form>
    </section>
  </section>

</template>

<script>
  import MkGetRow from "@/components/common/mk-get-row";
  import MkGetButton from "@/components/common/mk-get-button";
  import MkBackList from "@/components/common/mk-back-list";
  import {dirSocialsCreate, dirSocialsUpdate} from "@/api/modules/sys.socials.api";
  import MkUpload from "@/components/common/mk-upload";
  import MkMap from "@/components/common/mk-map";
  import MkMapSelect from "@/components/myWord/mk-map-select";
  import {dirTravelCreate, dirTravelUpdate} from "@/api/modules/sys.travel.api";

  export default {
    name: 'get-travel-budget',
    components: {MkMapSelect, MkMap, MkUpload, MkBackList, MkGetButton, MkGetRow},
    props: {
      updateData: {
        type: Object,
        default() {
          return {};
        }
      },
    },
    created() {
      if (this.updateData && this.updateData.id) {
        this.form = this.updateData
        this.isAdd = false
      }
    },
    data() {
      return {
        options: [
          {value: 1, label: '交通'},
          {value: 2, label: '住宿'},
          {value: 3, label: '饮食'},
          {value: 4, label: '娱乐'},
          {value: 5, label: '其他'},
        ],
        costAll: [],
        commonKey: 0,
        show: {
          map: false
        },

        form: {
          img: 'http://zhouyi.run:5222/api/public/admin/getFiles?id=aa239307f3033e705581591ef7f4607a.jpg&&mimetype=image/jpeg',
          latitude: 26.646694,
          longitude: 106.628201,
          type: 1
        },
        isAdd: true,
        rules: {
          city: [{required: true, message: '请输入城市名称', trigger: 'blur'},],
          img: [{required: true, message: '请输入城市图片', trigger: 'blur'},],
          latitude: [{required: true, message: '请选择城市坐标', trigger: 'blur'},],
          title: [{required: true, message: '请输入旅行标题', trigger: 'blur'},],
          // date: [{required: true, message: '请选择旅行时间', trigger: 'blur'},],
        }
      }
    },
    methods: {
      addCostList(data) {
        if (!data.type || !data.atm ||!data.num ||!data.things ) return   this.$message({
          message: '请填写完整信息',
          type: 'warning'
        });
        let obj = {
          type: data.type,
          label: data.type===1?'交通':data.type===2?'住宿':data.type===3?'饮食':data.type===4?'娱乐':'其他',
          atm: data.atm,
          num: data.num,
          things: data.things}
        this.costAll.push(obj)
        this.form.type=''
        this.form.atm=''
        this.form.num=''
        this.form.things=''
      },
      save() {
        this.$refs['formAdd'].validate((valid) => {
          if (valid) {
            let _FUC = ''
            _FUC = this.isAdd ? dirTravelCreate : dirTravelUpdate
            _FUC(this.form).then(res => {
              this.$toast.success(this.isAdd ? '添加成功！' : '修改成功！')
              this.$emit('close', true);
            }).catch(err => {
              console.log(err)
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      close(show) {
        if (show) {
          this.$toast.confirmSave().then(() => {
            this.$emit('close');
          });
        } else {
          this.$emit('close');
        }
      },
      mapClick(e) {
        console.log(e.poi)
        this.form.latitude = e.latLng.lat
        this.form.longitude = e.latLng.lng
        this.form.city = e.poi?.name || ''
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
