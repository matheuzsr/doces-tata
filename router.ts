import { createRouter, createWebHistory } from 'vue-router'
import App from './src/App.vue'

const routes = [
  {
    path: '/',
    component: App,
  },
  {
    path: '/pascoa-2025',
    component: () => import('./pages/pascoa-2025.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
