<script setup lang="ts">
import { ref, onMounted } from "vue";
import { supabase } from "./lib/supabase";
import Header from "./components/pascoa/Header.vue";
import EasterBanner from "./components/pascoa/EasterBanner.vue";
import Footer from "./components/pascoa/Footer.vue";
import MenuItems, { EasterItems } from "./components/pascoa/MenuItems.vue";

const easterItems = ref<EasterItems[]>([]);

const loadProducts = async () => {
  const { data, error } = await supabase
    .from("products")
    .select("*")
    .is("deleted_at", null);

  if (error) {
    console.error("Error loading products:", error);
    return;
  }

  easterItems.value = data;
};

onMounted(() => {
  loadProducts();
});
</script>

<template>
  <div class="min-h-screen bg-pink-50">
    <Header />
    <EasterBanner />
    <MenuItems :items="easterItems" />
    <Footer />
  </div>
</template>
