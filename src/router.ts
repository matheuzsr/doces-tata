import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import Admin from './pages/Admin.vue';
import { supabase } from './lib/supabase';

const routes = [
  {
    path: '/',
    component: App,
  },
  {
    path: '/admin',
    component: Admin,
    meta: { requiresAuth: true },
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach(async (to, from, next) => {
  if (to.meta.requiresAuth) {
    const { data: { session } } = await supabase.auth.getSession();
    if (!session) {
      // Redirect to login if not authenticated
      return next('/');
    }
  }
  next();
});

export default router;