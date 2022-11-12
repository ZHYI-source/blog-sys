<template>
  <div :id="id" :class="className" :style="{height:height,width:width}"/>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name:'mk-chart-com',
  props: {
    className: {
      type: String,
      default(){
        return 'chart'
      }
    },
    id: {
      type: String,
      default(){
        return 'chart'
      }
    },
    width: {
      type: String,
      default(){
        return '100%'
      }
    },
    height: {
      type: String,
      default(){
        return '300px'
      }
    },
    Max: {
      type: Number,
      default(){
        return 10
      }

    },
    option: {
      type: Object,
      default(){
        return {}
      }
    },
    //接受盒子高度 实现高度自适应
    changeHeight: 0
  },
  data() {
    return {
      chart: null
    }
  },
  mounted() {
    this.initChart()
    //监视窗口变化实现自适应
    window.addEventListener('resize', this.resizeChart)
  },

  destroyed() {
    //  及时销毁 防止内存泄露
    window.removeEventListener('resize', this.resizeChart)
  },
  beforeDestroy() {
    // // 如果这个dom不存在  那就不执行
    if (!this.chart) {
      return
    }
    this.chart.dispose()
    this.chart = null
  },
  methods: {
    resizeChart() {
      this.chart ? this.chart.resize() : ''
    },
    initChart() {
      this.chart = echarts.init(document.getElementById(this.id))
      this.chart.setOption(this.option)
    }
  }
}
</script>
