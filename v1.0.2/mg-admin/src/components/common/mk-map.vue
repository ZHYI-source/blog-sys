<template>
  <section>
    <template>
      <el-row>
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <template v-if="showBtn">
              <el-button style="margin: 15px" size="mini" type="primary" @click="startCar">开始</el-button>
              <el-button style="margin: 15px" size="mini" type="danger" @click="pauseMove">暂停</el-button>
              <el-button style="margin: 15px" size="mini" type="info" @click="resumeMove">继续</el-button>
            </template>
            <slot/>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple-light">
            <slot name="rightBtn"/>
          </div>
        </el-col>
      </el-row>

    </template>
    <div id="container" ref="container"></div>
  </section>
</template>

<script>
  /*
  https://lbs.amap.com/tools/picker 坐标拾取
  https://lbs.qq.com/webDemoCenter/javascriptV2/mapOperate/createMap 腾讯地图文档
  */
  export default {
    name: "mk-map",
    props: {
      showBtn: {
        type: Boolean,
        default() {
          return false
        }
      },
      zoom: {
        type: Number,
        default() {
          return 5
        }
      },
      // 坐标集合 [{latitude:26.646694, Longitude:106.628201}] 经度/纬度
      coordinateArr: {
        type: Array,
        default() {
          return [
            // {latitude: 28.655716, longitude: 101.42079},
            // {latitude: 26.646694, longitude: 106.628201},
            // {latitude: 30.246026, longitude: 120.210792},
            // {latitude: 31.230525, longitude: 121.473667},
            // {latitude: 28.655716, longitude: 121.42079},
          ]
        }
      }
    },
    data() {
      return {
        map: null,
        bounds: new TMap.LatLngBounds(),
        // mapCenter: {
        //   latitude: this.coordinateArr[0].latitude || 26.646694,
        //   longitude: this.coordinateArr[0].longitude || 106.628201
        // },
        //轨迹路径
        path: [],
        //标记点集合
        points: [],
        polylineLayer: null,
        marker: null,
        //标注点样式
        pointStyle: {
          common: new TMap.MarkerStyle({
            width: 30,
            height: 30,
            anchor: {
              x: 13,
              y: 30,
            },
            faceTo: 'map',
            rotate: 0,
            src: 'http://zhouyi.run:5222/api/public/admin/getFiles?id=c97afa2a656301d02f6a557d77b65795.png&&mimetype=image/png',
          }),
          'car-down': new TMap.MarkerStyle({
            width: 40,
            height: 40,
            anchor: {
              x: 20,
              y: 20,
            },
            faceTo: 'map',
            rotate: 180,
            src: 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/car.png',
          }),
          start: new TMap.MarkerStyle({
            width: 25,
            height: 35,
            anchor: {x: 16, y: 32},
            src: 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/start.png',
          }),
          end: new TMap.MarkerStyle({
            width: 25,
            height: 35,
            anchor: {x: 16, y: 32},
            src: 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/end.png',
          }),
        },
        //绘制路线样式
        lineStyle: {
          color: '#ff8d00', // 线填充色
          width: 4, // 折线宽度
          borderWidth: 2, // 边线宽度
          borderColor: '#FFF', // 边线颜色
          lineCap: 'round', // 线端头方式
          eraseColor: 'rgb(172,172,172)',//擦除路径的颜色
        }
      }
    },
    created() {
      this.loadPath()
      this.loadLabelPoint()

    },
    mounted() {
      this.initMap();
      this.showMarker()
    },
    methods: {
      //设置自适应显示marker
      showMarker() {
        let _this = this
        //判断标注点是否在范围内
        this.points.forEach(function (item) {
          //若坐标点不在范围内，扩大bounds范围
          if (_this.bounds.isEmpty() || !_this.bounds.contains(item.position)) {
            _this.bounds.extend(item.position);
          }
        })
        //设置地图可视范围
        this.map.fitBounds(this.bounds, {
          padding: 100 // 自适应边距
        });
      },
      //加载坐标路径
      loadPath() {
        for (const argument of this.coordinateArr) {
          this.path.push(new TMap.LatLng(argument.latitude, argument.longitude),)
        }
      },
      //批量设置标注点
      loadLabelPoint() {
        if (this.showBtn) {
          this.points = [
            {
              id: 'start',
              styleId: 'start',
              position: new TMap.LatLng(this.coordinateArr[0].latitude, this.coordinateArr[0].longitude),//起始点 贵阳
              properties: {
                // 标注点的属性数据
                title: '开始',
              },
            }
          ]
        }
        for (let i = 0; i < this.coordinateArr.length; i++) {
          let pointItem = {
            id: i,
            styleId: 'common',
            position: new TMap.LatLng(this.coordinateArr[i].latitude, this.coordinateArr[i].longitude),
            properties: this.coordinateArr[i],
          }
          // 小车标注
          if (this.showBtn && i === 0) {
            pointItem.styleId = 'car-down'
            pointItem.id = 'car'
          }
          // // 结束标注
          if (this.coordinateArr.length > 1 && i === this.coordinateArr.length - 1) {
            pointItem.styleId = 'end'
          }
          this.points.push(pointItem)
        }
      },
      //暂停动画
      pauseMove() {
        this.marker.pauseMove()
      },
      //停止动画
      resumeMove() {
        this.marker.resumeMove()
      },
      //开始动画
      startCar() {
        // 使用marker 移动接口， https://lbs.qq.com/webApi/javascriptGL/glDoc/glDocMarker
        //调用moveAlong动画 执行标记点动画开始
        this.marker.moveAlong(
          {
            car: {
              path: this.path,//移动路径的坐标串
              duration: 8000,//完成移动所需的时间，单位：毫秒
              speed: 8850, //speed为指定速度，正整数，单位：千米/小时
            },
          },
          {
            autoRotation: true,//自动旋转
          }
        );
        //监听事件名
        this.marker.on('moving', (e) => {
          var passedLatLngs = e.car && e.car.passedLatLngs;
          if (passedLatLngs) {
            // 使用路线擦除接口 eraseTo, https://lbs.qq.com/webApi/javascriptGL/glDoc/glDocVector
            this.polylineLayer.eraseTo(
              'erasePath',
              passedLatLngs.length - 1,
              passedLatLngs[passedLatLngs.length - 1]
            );
          }
        });

      },
      //初始化地图
      initMap() {
        let _this = this
        this.map = new TMap.Map('container', {
          zoom: this.zoom,
          showControl: false,
          // center: new TMap.LatLng(parseFloat(_this.coordinateArr[0].latitude), parseFloat(_this.coordinateArr[0].longitude)),
          // baseMap: {  // 设置卫星地图
          //   type: 'satellite'
          // },
        });
        // this.bounds = new TMap.LatLngBounds();
        // 轨迹线
        this.polylineLayer = new TMap.MultiPolyline({
          map: this.map, // 绘制到目标地图
          // 折线样式定义
          styles: {
            polylineStyle: new TMap.PolylineStyle(this.lineStyle),
          },
          geometries: [
            {
              id: 'erasePath',
              styleId: 'polylineStyle',
              paths: this.path,
            },
          ],
        });
        // 标注点
        this.marker = new TMap.MultiMarker({
          map: this.map,
          styles: this.pointStyle,
          geometries: this.points
        });
        // 监听标注点击事件
        this.marker.on("click", function (evt) {
          _this.$emit('markerClick', evt)
        })
      }
    }
  }
</script>

<style scoped>
  #container {
    width: 100%;
    height: calc(100vh - 280px);
    border-radius: 10px;
    overflow: hidden;
  }
</style>
