<template>
  <div class="min-h-screen bg-pink-50">
    <Header />
    <EasterBanner />
    <MenuItems :items="easterItems" :loading="loading" />
    <Footer />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { supabase } from '@/infra/supabase'
import Header from '@/src/components/morangoDoAmor/Header.vue'
import EasterBanner from '@/src/components/morangoDoAmor/EasterBanner.vue'
import Footer from '@/src/components/morangoDoAmor/Footer.vue'
import MenuItems, { EasterItems } from '@/src/components/morangoDoAmor/MenuItems.vue'

const easterItems = ref<EasterItems[]>([])
const loading = ref<boolean>(false)

const loadProducts = async () => {
  loading.value = true
  const { data, error } = await supabase
    .from('products')
    .select(
      `
      *,
      product_categories!inner (
        categories!inner (
          name
        )
      )
    `,
    )
    .eq('product_categories.categories.name', 'morango-do-amor')
    .is('deleted_at', null)
    .order('order', { ascending: true })
  loading.value = false

  if (error) {
    console.error('Error loading products:', error)
    return
  }

  easterItems.value = data
}

onMounted(() => {
  loadProducts()
})
</script>
