<template>
  <section>
    <section class="mk-add-pop">
      <el-form ref="formAdd" :model="form" :rules="rules" label-width="100px">

        <mk-get-row>
          <el-form-item label="GST" prop="axi_x">
            <el-input v-model="form.axi_x" size="mini" class="input-one" clearable placeholder="请输入GST"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="平均数" prop="axi_y">
            <el-input v-model="form.axi_y" size="mini" class="input-one" clearable placeholder="请输入平均数"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="标准误" prop="axi_y_a">
            <el-input v-model="form.axi_y_a" size="mini" class="input-one" clearable placeholder="请输入标准误"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="备注" prop="remark">
            <el-input v-model="form.remark" size="mini" class="input-one" clearable placeholder="请输入备注"></el-input>
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

  import {dirAnalysisCreate, dirAnalysisUpdate} from "@/api/modules/sys.analysis.api";


  export default {
    name: 'get-analysis-info',
    components: { MkBackList, MkGetButton, MkGetRow},
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
        form: {},
        isAdd: true,
        rules: {
          axi_x: [{required: true, message: '请输入X轴数据', trigger: 'blur'},],
          axi_y: [{required: true, message: '请输入Y轴数据', trigger: 'blur'},],
        }
      }
    },
    methods: {
      save() {
        this.$refs['formAdd'].validate((valid) => {
          if (valid) {
            let _FUC = ''
            _FUC = this.isAdd ? dirAnalysisCreate : dirAnalysisUpdate
            _FUC(this.form).then(res => {
              this.$toast.success(this.isAdd ?'添加成功！':'修改成功！')
              this.$emit('close',true);
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
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
