<template>
	<view class="">
		<!-- 判断是否登入 -->
		<block v-if="isLogin == true">
			<!-- 顶部图片 -->
			<view class="top-img">
				<image class="fengrui-img" src="../../static/my/bg15.svg" mode="aspectFill"></image>
			</view>
			<view class="sel-over-w" style="">
				<!-- 头像 -->
				<view class="self-w">
					<view class="self-user-img">
						<image class="fengrui-img" :src="xingsu.avatarUrl" mode="aspectFill"></image>
					</view>
					<view class="self-user-info">
						<view class="self-user-info-name">
							{{ xingsu.nickName }}
						</view>
						<view class="self-user-info-describe">
							青春里的温柔一定与你有关
						</view>
					</view>
					<view class="self-user-updata" @tap="updatauser()">
						<image :animation="animationData" class="fengrui-img" src="../../static/my/f5.svg" mode="aspectFill"></image>
					</view>
				</view>
				<!-- me-svg -->
				<view class="me-svg">
          <button class="me-sbg-btn" hover-class="fengrui-li-hover" @tap="goMessage()">
            <view class="Vajra-list-img">
              <image class="fengrui-img" src="../../static/image/ew.png" mode="aspectFill"></image>
            </view>
            <view class="Vajra-list-font">
              留言
            </view>
          </button>
          <button class="me-sbg-btn" hover-class="fengrui-li-hover" @tap="show=true">
            <view class="Vajra-list-img">
              <image class="fengrui-img" src="../../static/image/code.png" mode="aspectFill"></image>
            </view>
            <view class="Vajra-list-font">
              源码
            </view>
          </button>
          <button class="me-sbg-btn" hover-class="fengrui-li-hover" @tap="showWeb=true">
            <view class="Vajra-list-img">
              <image class="fengrui-img" src="../../static/image/zhuye.png" mode="aspectFill"></image>
            </view>
            <view class="Vajra-list-font">
              博客站点
            </view>
          </button>
          <button class="me-sbg-btn" hover-class="fengrui-li-hover" @tap="popupSever()">
            <view class="Vajra-list-img">
              <image class="fengrui-img" src="../../static/image/fx.png" mode="aspectFill"></image>
            </view>
            <view class="Vajra-list-font">
              分享码
            </view>
          </button>
				</view>
			</view>

			<!-- 功能列表 -->
			<view class="metergasis">
        <view class="metergasis-li" hover-class="fengrui-li-hover" @tap="abouTap()">
          <view class="metergasis-li-img">
            <image class="fengrui-img" src="../../static/my/about.svg" mode="aspectFill"></image>
          </view>
          <view class="metergasis-li-h">
            关于作者
          </view>
          <view class="metergasis-li-rgth">
            <image class="fengrui-img" src="../../static/my/more.svg" mode=""></image>
          </view>
        </view>

				<view class="metergasis-li" hover-class="fengrui-li-hover" @tap="clearTap()">
					<view class="metergasis-li-img">
						<image class="fengrui-img" src="../../static/my/cache.svg" mode="aspectFill"></image>
					</view>
					<view class="metergasis-li-h">
						清除缓存
					</view>
					<view class="metergasis-li-rgth">
						<image class="fengrui-img" src="../../static/my/more.svg" mode=""></image>
					</view>
				</view>
				<view class="metergasis-li" hover-class="fengrui-li-hover" @tap="clearTap()">
					<view class="metergasis-li-img">
						<image class="fengrui-img" src="../../static/my/exit.svg" mode="aspectFill"></image>
					</view>
					<view class="metergasis-li-h">
						退出登录
					</view>
					<view class="metergasis-li-rgth">
						<image class="fengrui-img" src="../../static/my/more.svg" mode=""></image>
					</view>
				</view>
			</view>
		</block>
    <u-popup :show="show" :round="5" mode="center" @close="show=false">
      <view>
        <view>
          <image src="http://zhouyi.run:5222/api/public/admin/getFiles?id=ea2fc61a8776876a98f512d4e8652b38.png&&mimetype=image/png" mode="aspectFit"></image>
        </view>
        <view style="padding: 10rpx">
          <u-button type="primary" text="复制源码地址" @click="goCode()"></u-button>
        </view>
      </view>
    </u-popup>
    <u-popup :show="showWeb" :round="5" mode="center" @close="showWeb=false">
      <view>
        <view>
          <image src="http://zhouyi.run:5222/api/public/admin/getFiles?id=ed2f99c455eb35c1fd518cb0107e5069.png&&mimetype=image/png" mode="aspectFit"></image>
        </view>
        <view style="padding: 10rpx">
          <u-button type="primary" text="复制站点地址" @click="goWebsite()"></u-button>
        </view>
      </view>
    </u-popup>
		<block v-if="isLogin == false" >
			<view class="login-w">
				<view class="login-img">
					<image class="feng-img" src="../../static/my/nologin.svg" mode="widthFix"></image>
				</view>
				<!-- 猜你想搜 -->
				<view class="titel-h">
					置若罔闻
				</view>
				<view class="self-user-info-describe">
					一直敲一扇不开的门，是不礼貌的
				</view>
				<view class="login-btn">
					<button hover-class="fengrui-blue-btn-lo-hover" hover-start-time="40" hover-stay-time="100" class="login-btn-lo" openType="getUserInfo" lang="zh_CN" @tap="getUserInfo">登录</button>
				</view>
			</view>
		</block>
	</view>
</template>

<script>
	export default {
		data() {
			return {
        show:false,
        showWeb:false,
				isLogin: false,
				xingsu: [],
				about_center: [],
				isLoginBtn:false,
				animationData: {},
			}
		},
		onShow: function() {
			// 初始化动画
		      var animation = uni.createAnimation({
		        duration: 800,
		        timingFunction: 'ease',
		      })
		      this.animation = animation
		    },
		onLoad() {
			// 微信分享盆友圈
			//#ifdef MP-WEIXIN
			wx.showShareMenu({
				withShareTicket: true,
				menus: ['shareAppMessage', 'shareTimeline']
			})
			//#endif
			// 判断是否有登入
			this.checkLogin();

		},

		// 分享好友配置
		onShareAppMessage(res) {
			var that = this;
			if (res.from === 'button') { // 来自页面内分享按钮
				console.log(res.target)
			}
			return {
				title: "MG'blog",
				imageUrl: that.about_center[0].share_title_url,
				path: 'pages/me/me'
			}
		},

		methods: {
      goMessage(){
        uni.navigateTo({
          url: '/pages/message/index'
        });
      },

			// 点击更新
			updatauser: function() {
				var that = this;
				that.getUserInfo();
				that.animation.rotate(180).step();
				that.animationData = this.animation.export();
				uni.showToast({
					title: '用户信息已更新',
					duration: 2000
				});
			},

			// 用户登录
			getUserInfo: function() {
				var that = this;
				//#ifdef MP-QQ
				uni.getUserInfo({
					success: function(infoRes) {
						console.log(infoRes)
						that.xingsu = infoRes.userInfo;
						that.isLogin = true;
						uni.setStorageSync("xsUserInfo_key", that.xingsu);
					}
				});
				//#endif

				//#ifdef MP-WEIXIN
				uni.getUserProfile({
					desc: '用于完善用户资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
					success: (res) => {
						console.log(res.userInfo)
						that.xingsu = res.userInfo;
						that.isLogin = true;
						uni.setStorageSync("xsUserInfo_key", that.xingsu);
					}
				})
				//#endif
			},

			// 检测是否有登入  赋值给xsUserInfo判断是否为空
			checkLogin: function() {
				var that = this;
				var xsUserInfo = uni.getStorageSync('xsUserInfo_key');
				if (xsUserInfo == '') {
					this.isLogin = false;

				} else {
					that.isLogin = true;
					that.xingsu = xsUserInfo;
				}
			},

			// 清除缓存
			clearTap: function() {
				var that = this;
				uni.clearStorageSync();
				uni.clearStorage();
				uni.showToast({
					title: '清理成功',
					duration: 2000
				})
				uni.switchTab({
					// #ifdef MP-WEIXIN
					url: '../index/index'
					// #endif
				})
				that.isLogin = false;
			},

			// 标题页跳转
			allTag: function() {
				uni.navigateTo({
					// #ifdef MP-WEIXIN
					url: '../tags/tags',
					// #endif
				})
			},
			abouTap: function() {
				uni.navigateTo({
					// #ifdef MP-WEIXIN
					url: './about',
					// #endif
				})
			},
			questionsTap: function() {
				uni.navigateTo({
					// #ifdef MP-WEIXIN
					url: '../questions/questions-list',
					// #endif
				})
			},
			statementTap: function() {
				uni.showModal({
					title: '声明',
					content: '禁止将该产品用于含诈骗、赌博、色情、木马、病毒等违法违规业务！',
					success: function(res) {
						if (res.confirm) {
							console.log('用户点击确定');
						} else if (res.cancel) {
							console.log('用户点击取消');
						}
					}
				});
			},
      copyBtn: function(val) {
        uni.setClipboardData({
          data: val,
          success: function () {
            uni.showToast({
              icon:'none',
              title: '链接复制成功,请到浏览器中打开',
            });
          },
          fail:function () {
            uni.showToast({
              title: '复制失败',
            });
          }
        });
      },
      goCode:function (url){
        this.show=false
        this.copyBtn('https://gitee.com/Z568_568/all-blog-sys.git')
      },
      goWebsite:function (url){
        this.showWeb=false
        this.copyBtn('http://www.zhouyi.run/#/')
      },
			// 保存在相册 分享海报
			popupSever: function() {
				var that = this;
				//#ifdef MP-WEIXIN
				uni.previewImage({
					current: 1,
					urls: ['http://zhouyi.run:5222/api/public/admin/getFiles?id=69e94872e4cf78a8ba8c2b573594e3b4.jpg&&mimetype=image/jpeg'],
					longPressActions: {
						itemList: ['发送给朋友', '保存图片', '收藏'],
						success: function(data) {
							console.log('选中了第' + (data.tapIndex + 1) + '个按钮,第' + (data.index + 1) + '张图片');
						},
						fail: function(err) {
							console.log(err.errMsg);
						}
					}
				});
				//#endif

				//#ifdef MP-QQ
				uni.previewImage({
					current: 1,
					urls: [that.about_center[0].qq_posterdata_copy],
					longPressActions: {
						itemList: ['发送给朋友', '保存图片', '收藏'],
						success: function(data) {
							console.log('选中了第' + (data.tapIndex + 1) + '个按钮,第' + (data.index + 1) + '张图片');
						},
						fail: function(err) {
							console.log(err.errMsg);
						}
					}
				});
				//#endif
			},
		}

	}
</script>

<style>
	/* 顶部图片 */
	.top-img {
		width: 100%;
		height: 340upx;
		overflow: hidden;
	}

	/* 登陆框 */
	.login-btn-lo {
		background-color: #007AFF;
		border-radius: 100upx;
		height: 80upx;
		width: 550upx;
		line-height: 80upx;
		color: #FFFFFF;
	}
	.login-btn-qu {
		background-color: #FD6D6D;
		border-radius: 100upx;
		height: 80upx;
		width: 300upx;
		line-height: 80upx;
		color: #FFFFFF;
	}

	.login-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 0upx 30upx;
		margin-top: 80upx;

	}

	.feng-img {
		height: 100%;
		margin: auto;
		display: block;
	}

	.login-img {
		height: 600upx;
		overflow: hidden;
		border-radius: 20upx;
		position: relative;
		width: 100%;
	}

	.login-w {
		width: 76%;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}

	.titel-h {
		font-size: 38upx;
		margin: 30upx 0upx;
		position: relative;
	}

	.titel-h:after {
		content: '';
		position: absolute;
		bottom: -14upx;
		left: 0px;
		width: 96upx;
		height: 8upx;
		border-radius: 200upx;
		background: linear-gradient(90deg, rgba(55, 110, 234, 1) 0%, rgba(255, 255, 255, 1) 100%);
	}

	/* 功能列表 */
	.metergasis-li-rgth {
		width: 50upx;
		height: 50upx;
		overflow: hidden;
		flex-shrink: 0;
		position: absolute;
		right: 0upx;
		top: 50%;
		transform: translate(0%, -50%);
	}

	.metergasis-li-h {
		grid-row: 1;
		margin-left: 30upx;
		font-size: 30upx;
	}

	.metergasis-li-img {
		height: 52upx;
		width: 52upx;
		border-radius: 100upx;
		flex-shrink: 0;
	}

	.metergasis-li {
		padding: 24upx 32upx;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		position: relative;
	}
	.metergasis {
		background-color: #FFFFFF;
		border-radius: 16upx;
		margin: 48upx 0upx;
		padding: 2upx;
		margin: 30upx;
	}

	/* me-svg */
	.Vajra-list-font {
		color: #807C7C;
		font-size: 20upx;
	}

	.Vajra-list-img {
		height: 60upx;
		width: 60upx;
		overflow: hidden;
		margin: auto;
	}

	.me-sbg-btn {
		flex-shrink: 0;
		justify-content: center;
		align-items: center;
		width: 25%;
		padding: 14upx 0upx;
	}

	.me-svg {
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-radius: 16upx;
		margin-bottom: 20upx;
	}

	/* 流量主广告或者图片 */
	.me-ads {
		border-radius: 18upx;
		margin: 48upx 0upx;
		overflow: hidden;
		margin: 30upx;
	}

	/* 头像 */
	.self-user-updata {
		width: 40upx;
		height: 40upx;
		position: absolute;
		right: 48upx;
	}

	.self-user-info-describe {
		color: #807C7C;
		font-size: 24upx;
		margin-top: 18upx;
	}

	.self-user-info-name {
		font-size: 48upx;
		flex-grow: 1;
	}

	.self-user-info {
		margin: 0upx 24upx;
	}

	.self-user-img {
		height: 120upx;
		width: 120upx;
		border-radius: 100upx;
		overflow: hidden;
		flex-shrink: 0;
	}

	.self-w {
		display: flex;
		justify-content: flex-start;
		padding: 48upx 26upx;
		align-items: flex-end;
		overflow: hidden;
		position: relative;
	}

	.sel-over-w {
		overflow: hidden;
		background-color: #FFFFFF;
		margin: 0upx 28upx;
		border-radius: 16upx;
	}

	/* 全局 */
	.center {
		margin: 48upx;
	}

	page {
		background-color: #f7f7f7;
		overflow-x: hidden;
	}

	.fengrui-img {
		height: 100%;
		width: 100%;
	}

	button {
		padding-left: 0upx;
		padding-right: 0upx;
		background-color: #FFFFFF;
	}
	.button-hover{
		background-color: #FFFFFF !important;
	}

	button::after {
		border: 0px solid rgba(0, 0, 0, .2);

	}

	/* 暗黑模式下应用的样式 */
	@media (prefers-color-scheme: dark) {
		page {
			background: #161616;
		}

		.sel-over-w,
		.self-w {
			background-color: #202020;
		}

		.metergasis {
			background-color: #202020;
		}

		.me-svg {
			background-color: #202020;
		}

		.me-sbg-btn {
			background-color: #202020;
		}

		button {
			background-color: #202020;
		}
	}
</style>
