import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Pascoa2025 from '@/pages/pascoa-2025.vue'

const routes: RouteRecordRaw[] = [
  {
    path: '/',
    redirect: '/pascoa-2025'
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
