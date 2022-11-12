<template>
  <section>
    <el-button style="margin: 15px" size="mini" type="danger" @click="removeMarker">清除标记</el-button>
    <div id="containers"></div>
  </section>
</template>

<script>
  export default {
    name: "mk-map-select",
    data() {
      return {
        map: null,
        path: [],
        polylineLayer: null,
        marker: null
      }
    },
    mounted() {
      this.initMap()
    },
    methods: {
      removeMarker() {
        if (this.marker) {
          this.marker.setMap(null)
          this.$emit('closeMap')
        }
      },
      initMap() {
        //设置地图中心点
        let center = new TMap.LatLng(39.984104, 116.307503);
        // 初始化地图
        this.map = new TMap.Map('containers', {
          key: 'select-map',
          zoom: 5,
          center: center,
          showControl: false,
        });
        // 标注点
        this.marker = new TMap.MultiMarker({
          map: this.map,
          styles: this.pointStyle,
        });

        this.map.on('click', (e) => {

          this.$emit('mapClick', e)
          this.marker.add({
            position: e.latLng
          });
          console.log(this.marker)
        });
      }
    }
  }
</script>

<style lang="scss" scoped>
  #containers {
    width: 100%;
    height: 400px;
    border-radius: 10px;
    overflow: hidden;
  }
</style>
