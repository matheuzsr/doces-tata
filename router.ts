import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Pascoa2025 from '@/pages/pascoa-2025.vue'
import MorangoDoAmor from '@/pages/morango-do-amor.vue'

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    redirect: '/morango-do-amor'
  },
  {
    path: '/morango-do-amor',
    component: MorangoDoAmor,
  },
  {
    path: '/pascoa-2025',
    component: Pascoa2025,
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
