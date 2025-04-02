import { createApp } from 'vue'
import router from './router'
import App from './src/App.vue'
import './style/index.css'

const app = createApp(App)
app.use(router)
app.mount('#root')
