import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'home',
        component: () => import('../views/Home.vue'),
        meta: { title: '首页'}
    },
    {
        path: '/all',
        name: 'allArticle',
        component: () => import('../views/AllArticle'),
        meta: { title: '全部文章', params: 'allArticle'}
    },
    {
        path: '/category/:cate',
        name: 'category',
        component: () => import('../views/Home.vue'),
        meta: { title: '分类', params: 'cate'}
    },
    {
        path: '/search/:words',
        name: 'search',
        component: () => import('../views/Home.vue'),
        meta: { title: '搜索', params: 'words'}
    },
    {
        path: '/about',
        name: 'about',
        component: () => import('../views/About.vue'),
        meta: { title: '关于'}
    },
    {
        path: '/archive',
        name: 'archive',
        component: () => import('../views/Archive.vue'),
        meta: { title: '归档'}
    },
    {
        path: '/friend',
        name: 'friend',
        component: () => import('../views/Friend.vue'),
        meta: { title: '友链'}
    },
    {
        path: '/article/:id',
        name: 'article',
        component: () => import('../views/Articles.vue'),
        meta: { title: '文章'}
    }
]

const router = new VueRouter({
    mode: 'hash',
    // base: process.env.BASE_URL,
    routes
})
router.beforeEach((to, from, next) => {
    let title = "MG'blog"
    if (to.meta.params){
        title = `${title}-${to.meta.title}:${to.params[to.meta.params] || ''}`
    }else {
        title = `${title}-${to.meta.title} `
    }
    document.title = title
    if (to.path !== from.path) {
        store.dispatch('setLoading', true);
    }
    next();
})
router.afterEach((to, from) => {
    // 最多延迟 关闭 loading
    setTimeout(() => {
        // window.scroll(0,0)
        store.dispatch('setLoading', false);
    }, 500)
})
export default router
