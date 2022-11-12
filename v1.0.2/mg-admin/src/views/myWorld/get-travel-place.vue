<template>
  <section>
    <section class="mk-add-pop">
      <el-form ref="formAdd" :model="form" :rules="rules" label-width="100px">
        <mk-get-row>
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
          <el-form-item label="城市图片" prop="img">
            <el-input clearable v-model.trim="form.img" size="mini" style="width: 600px" type="textarea"
                      :rows="3"
                      placeholder="请输入在线图片地址"
            />
            <mk-upload v-model="form.img"/>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="旅行标题" prop="title">
            <el-input v-model="form.title" size="mini" :rows="3"
                      maxlength="255" style="width: 600px" type="textarea" clearable
                      placeholder="请输入旅行标题"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="旅行预算" prop="title">
            <el-input v-model="form.budget" size="mini" class="input-one" clearable
                      placeholder="请输入旅行预算"></el-input>
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
  import {dirTravelCreate, dirTravelUpdate} from "@/api/modules/sys.travel.api";

  export default {
    name: 'get-travel-place',
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
          city: [{required: true, message: '请输入城市名称', trigger: 'blur'},],
          img: [{required: true, message: '请输入城市图片', trigger: 'blur'},],
          latitude: [{required: true, message: '请选择城市坐标', trigger: 'blur'},],
          title: [{required: true, message: '请输入旅行标题', trigger: 'blur'},],
          // date: [{required: true, message: '请选择旅行时间', trigger: 'blur'},],
        }
      }
    },
    methods: {
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
