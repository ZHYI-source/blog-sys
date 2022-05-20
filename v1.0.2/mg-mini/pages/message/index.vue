<template>
    <view class="content">
        <view class="section message-head">
            <view>
                ✨ 优化建议或者页面有bug可以在下方给我留言哦！
            </view>
            <view>
            😜 欢迎您的来访…
            </view>
        </view>
        <u-gap height="15" bgColor="#f2f5f9"></u-gap>
        <view class="section section-form">
            <u-alert   type = "info" fontSize="12" description = "🎈 留言成功后会以邮件回复"></u-alert>
            <view class="form-row">
                <view class="row-title">邮箱：</view>
                <u--input
                        placeholder="****@qq.com"
                        border="surround"
                        fontSize="13"
                        placeholderClass="input-plc"
                        v-model="form.email"

                ></u--input>
            </view>
            <view class="form-row">
                <view class="row-title">内容：</view>
                <u--textarea
                        style="font-size: 12px"
                        v-model="form.content"
                >

                </u--textarea>
            </view>
            <view class="form-row">
                <u-button type="primary" text="提交" @click="saveMessage"></u-button>
            </view>

        </view>
        <u-back-top :scroll-top="scrollTop" icon="arrow-up" mode="circle" :customStyle="customStyle" :iconStyle="iconStyle"></u-back-top>
    </view>
</template>

<script>
    import {dirArticle} from "../../api/mini.article";
    import {getMessageCreate} from "../../api/mini.friends";

    export default {
        data(){
            return {
                dataList:[],
                cateName:'',
                form:{},
                count:0,
                query: {
                    //查询推荐并且按是否顶置排序查询
                    params: {
                        isRecommend: true,
                        article_title:''
                    },
                    limit: 10,//每页条数
                    offset: 1,//当前页
                    sort: {
                        prop: 'isTop',
                        order: 'desc',
                    }
                }
            }
        },
        onReachBottom(e) {
            this.query.offset+=1
            this.getDataList()
        },
        methods:{
            goPage(cateId){
                this.query.params.sort_id = cateId
                this.getDataList()
            },
            getDataList(){
                this.$toast.loading()
                dirArticle(this.query).then(res=>{
                    this.$toast.hideLoading()
                    this.count = res.data.count
                    for (const re of res.data.data) {
                        this.dataList.push(re)
                    }
                }).catch(err=>{
                    console.log(err)
                })
            },
            goPostDetail(row){
                uni.navigateTo({
                    url: '/pages/article/mg-article-view?id='+row.id
                });
            },
            saveMessage(){
                if (!this.form.email) return this.$toast.error('邮箱不能为空')
                if (!this.form.content) return this.$toast.error('内容不能为空')
                this.$toast.loading()
                getMessageCreate(this.form).then(res=>{
                    this.$toast.hideLoading()
                    this.$toast.success('留言成功！')
                    this.form.email=''
                    this.form.content=''
                }).catch(err=>{
                    console.log(err)
                    this.$toast.hideLoading()
                    this.$toast.error('留言失败！')
                })
            }
        },
        onLoad(opt) {
            this.goPage(opt.cateId)
            this.cateName = opt.cateName
        },
    }
</script>

<style lang="scss" scoped>
    .content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding-top: 20rpx;
    }
    .section {
        width: 700rpx;
        margin: 0rpx auto;
        box-sizing: border-box;
        background-color: #fff;
        border-radius: 10rpx;
        &-form {
            padding: 20rpx;

            .form-row {
                padding: 15rpx;
                .row-title {
                    padding: 15rpx 0;
                }
                /deep/.input-plc {
                    font-size: 24rpx;
                }
            }
        }

    }
    .section-header {
        display: flex;
        justify-content: space-between;
        align-content: center;
        width: 100%;
        padding: 0 25rpx;
        .head-left {
            position: relative;
            padding-left: 20rpx;
            font-weight: bold;
            &:before {
                content: '';
                position: absolute;
                left: 0rpx;
                top: 0rpx;
                width: 10rpx;
                height: 100%;
                border-radius: 5rpx;
                background-color: #d81e06;

            }
        }
        .head-right {
            font-size: 12px;
            color: #999;
        }
    }
    .message-head {
        padding: 30rpx;
        position: relative;
        font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
        color: #908f8f;
        line-height: 28px;
        &:before {
            content: '';
            position: absolute;
            left: 0rpx;
            top: 0rpx;
            width: 10rpx;
            height: 100%;
            border-bottom-left-radius: 10rpx;
            border-top-left-radius: 10rpx;
            background-color: #d81e06;

        }
        .search-box {
            margin-top: 15px;
        }
    }



</style>
