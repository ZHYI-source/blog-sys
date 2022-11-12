<template>
  <section>
    <section class="mk-add-pop">
      <el-form ref="formAdd" :model="form" :rules="rules" label-width="100px">
        <mk-get-row>
          <el-form-item label="角色名称" prop="role_name">
            <el-input v-model="form.role_name" :disabled="form.role_name==='admin'" size="mini" class="input-one"
                      clearable placeholder="请输入角色名称"></el-input>
          </el-form-item>
        </mk-get-row>
        <mk-get-row>
          <el-form-item label="角色描述" prop="role_desc">
            <el-input v-model="form.role_desc" :disabled="form.role_name==='admin'" size="mini" class="input-one"
                      clearable placeholder="请输入角色描述"></el-input>
          </el-form-item>
        </mk-get-row>
        <!--        <mk-get-row>-->
        <!--          <el-form-item label="权限">-->
        <!--            <mk-menu-tree v-model="form.menuIds" :roleId='form.id'/>-->
        <!--            &lt;!&ndash;            <get-perm-info v-model="form.menuIds"/>&ndash;&gt;-->
        <!--          </el-form-item>-->
        <!--        </mk-get-row>-->
        <mk-get-row>
          <el-form-item label="权限">
            <el-tree
              :data="treeData"
              show-checkbox
              check-strictly
              :default-checked-keys="form.menuIds"
              @check="checkNode"
              node-key="id">
               <span class="custom-tree-node" slot-scope="{ node, data }">
               <span>{{ node.data.title }}</span>
                <el-tag style="margin-left: 8px" size="mini" v-show="node.data.authority">{{node.data.authority}}</el-tag>
          </span>
            </el-tree>
          </el-form-item>
        </mk-get-row>
        <el-alert
          v-if="form.role_name==='admin'"
          title="** 超级管理员角色不能修改"
          type="warning">
        </el-alert>
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

import {dirRolesCreate, dirRolesOne, dirRolesUpdate} from "@/api/modules/sys.roles.api";
import MkMenuTree from "@/components/common/mk-menu-tree";
import {dirMenusList} from "@/api/modules/sys.menus.api";
import util from "@/libs/util";
import GetPermInfo from "@/views/system/roles/get-perm-info";

export default {
  name: 'get-roles-info',
  components: {GetPermInfo, MkMenuTree, MkBackList, MkGetButton, MkGetRow},
  props: {
    updateData: {
      type: Object,
      default() {
        return {};
      }
    },
  },
  created() {
    this.getTreeData()
    if (this.updateData && this.updateData.id) {
      this.form = this.updateData

      let menusId = []
      dirRolesOne({params: {id: this.updateData.id}}).then(role => {
        for (const argument of role.menus) {
          menusId.push(argument.id)
        }
        // console.log(menusId)
        this.$set(this.form, 'menuIds', menusId)
        console.log(this.form)
        this.form.testId = '123'
        this.isAdd = false
      })
    }
  },
  data() {
    return {



      commonKey: 0,
      form: {},
      treeData: [],
      defaultKey: [],
      defaultProps: {
        children: 'children',
        label: 'label'
      },

      query: {
        limit: 300
      },
      isAdd: true,
      rules: {
        role_name: [{required: true, message: '请输入角色名称', trigger: 'blur'},],
        menuIds: [{required: true, message: '请选择权限', trigger: 'blur'},],
      }
    }
  },
  methods: {
    getTreeData() {
      dirMenusList({
        params: {
          id: ''
        },
        limit: 300
      }).then(res => {
        this.treeData = this.listToTree(res.data)
      })
    },

    listToTree(list) {
      let map = {}, node, tree = [], i;
      for (i = 0; i < list.length; i++) {
        map[list[i].id] = list[i];
        list[i].children = [];
      }
      for (i = 0; i < list.length; i += 1) {
        node = list[i];
        if (node.pid !== 1) {
          map[node.pid].children.push(node);
        } else {
          // delete
          tree.push(node);
        }
      }
      return tree;
    },

    checkNode(node,keys){
      console.log(node)
      console.log(keys)
      this.form.menuIds = [...keys.checkedKeys]
    },

    save() {
      this.$refs['formAdd'].validate((valid) => {
        if (valid) {
          console.log(this.form)
          let _FUC = ''
          _FUC = this.isAdd ? dirRolesCreate : dirRolesUpdate
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
    }
  }
}
</script>

<style lang="scss" scoped>
.menu-tree {
  min-width: 200px;
  width: 400px;
  padding: 15px;
  border: 1px solid #eee;
  border-radius: 5px;

  .block {
    font-size: 14px;
  }

}
</style>
