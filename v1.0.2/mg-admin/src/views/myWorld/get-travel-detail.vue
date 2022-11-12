<template>
  <section>
    <section class="mk-add-pop">
      <el-form ref="formAdd" :model="form" :rules="rules" label-width="100px">
        <mk-get-row>
          <el-form-item label="旅行Id" prop="travel_id">
            <el-input v-model="form.travel_id" size="mini" class="input-one" clearable placeholder="请输入旅行id"></el-input>
          </el-form-item>
          <el-form-item label="城市" prop="city">
            <el-input v-model="form.city" size="mini" class="input-one" clearable placeholder="请输入城市名称"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="坐标" prop="latitude">
            <el-tag size="mini" style="margin-right: 8px">经度：{{form.latitude || '-'}}</el-tag>
            <el-tag size="mini" style="margin-right: 8px">纬度：{{form.longitude || '-'}}</el-tag>
            <el-button @click="()=>{this.show.map=!this.show.map}" size="mini">{{this.show.map?'选取完成':'选取坐标'}}
            </el-button>
          </el-form-item>
        </mk-get-row>
        <div style="margin-bottom: 10px">
          <mk-map-select v-if="show.map" @closeMap="()=>{this.show.map=false}" @mapClick="mapClick"/>
        </div>
        <mk-get-row>
          <el-form-item label="城市图片" prop="planImgs">
            <el-input clearable v-model.trim="form.planImgs" size="mini" style="width: 600px" type="textarea"
                      :rows="3"
                      placeholder="请输入在线图片地址"
            />
            <mk-upload v-model="form.planImgs"/>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="旅行日期" size="mini" prop="planDate">
            <el-date-picker
              value-format="yyyy-MM-dd"
              type="date"
              class="input-one"
              clearable
              v-model="form.planDate"
              placeholder="选择日期">
            </el-date-picker>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="持续时间" prop="duration">
            <el-input v-model="form.duration" size="mini" class="input-one" clearable placeholder="请输入持续时间"></el-input>
          </el-form-item>
          <el-form-item label="是否完成" prop="isDone">
            <el-radio-group size="mini" class="input-one" clearable placeholder="请输入是否完成" v-model="form.isDone">
              <el-radio :label="true">已完成</el-radio>
              <el-radio :label="false">待完成</el-radio>
            </el-radio-group>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="计划内容" prop="planTxt">
            <el-input v-model="form.planTxt" size="mini" style="width: 600px" type="textarea"
                      :rows="3" clearable placeholder="请输入计划内容"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="备注" prop="mark">
            <el-input v-model="form.mark" size="mini" style="width: 600px" type="textarea"
                      :rows="3" clearable placeholder="请输入备注"></el-input>
          </el-form-item>
        </mk-get-row>
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
  import {
    dirTravelCreate,
    dirTravelCreateDetail,
    dirTravelUpdate,
    dirTravelUpdateDetail
  } from "@/api/modules/sys.travel.api";

  export default {
    name: 'get-travel-detail',
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
      if (this.updateData && this.updateData.add) {
        this.form.travel_id = this.updateData.id
        this.isAdd = true
      }else {
        console.log(this.updateData)
        this.form = this.updateData
        this.isAdd = false
      }
    },
    data() {
      return {
        commonKey: 0,
        show: {
          map: false
        },

        form: {
          img: 'http://zhouyi.run:5222/api/public/admin/getFiles?id=aa239307f3033e705581591ef7f4607a.jpg&&mimetype=image/jpeg',
          latitude: 26.646694,
          longitude: 106.628201
        },
        isAdd: true,
        rules: {
          travel_id: [{required: true, message: '请输入旅行id', trigger: 'blur'},],

          city: [{required: true, message: '请输入地点', trigger: 'blur'},],

          latitude: [{required: true, message: '请输入经度', trigger: 'blur'},],

          longitude: [{required: true, message: '请输入纬度', trigger: 'blur'},],

          planDate: [{required: true, message: '请输入旅行计划日期', trigger: 'blur'},],

          duration: [{required: true, message: '请输入持续时间', trigger: 'blur'},],

          isDone: [{required: true, message: '请输入是否完成', trigger: 'blur'},],

        }
      }
    },
    methods: {
      save() {
        this.$refs['formAdd'].validate((valid) => {
          if (valid) {
            let _FUC = ''
            _FUC = this.isAdd ? dirTravelCreateDetail : dirTravelUpdateDetail
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
        this.form.latitude = e.latLng.lat
        this.form.longitude = e.latLng.lng
        this.form.city = e.poi?.name || ''
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
