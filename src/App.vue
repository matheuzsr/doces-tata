<script setup lang="ts">
import Header from "./components/pascoa/Header.vue";
import EasterBanner from "./components/pascoa/EasterBanner.vue";
import MenuItems from "./components/pascoa/MenuItems.vue";
import Footer from "./components/pascoa/Footer.vue";

const easterItems = [
  {
    name: "Ovo de Páscoa Trufado",
    description: "Chocolate belga recheado com trufa cremosa",
    price: "R$ 89,90",
    sizes: ["500g", "750g", "1kg"],
    image:
      "https://images.unsplash.com/photo-1610450949065-1f2841536c88?auto=format&fit=crop&q=80&w=400",
  },
  {
    name: "Coelho de Chocolate",
    description: "Chocolate ao leite decorado artesanalmente",
    price: "R$ 45,90",
    sizes: ["250g", "400g"],
    image:
      "https://images.unsplash.com/photo-1552767059-ce182ead6c1b?auto=format&fit=crop&q=80&w=400",
  },
  {
    name: "Cesta de Páscoa Premium",
    description: "Ovo de páscoa + bombons + brigadeiros especiais",
    price: "R$ 159,90",
    sizes: ["Kit Médio", "Kit Grande"],
    image:
      "https://images.unsplash.com/photo-1515595967223-f9fa59af5cd3?auto=format&fit=crop&q=80&w=400",
  },
  {
    name: "Mini Ovos Recheados",
    description: "Caixa com 12 mini ovos sortidos",
    price: "R$ 49,90",
    sizes: ["12 unidades", "24 unidades"],
    image:
      "https://images.unsplash.com/photo-1616628188467-8aa0cf877a47?auto=format&fit=crop&q=80&w=400",
  },
];
</script>

<template>
  <div class="min-h-screen bg-pink-50">
    <Header />
    <EasterBanner />
    <MenuItems :items="easterItems" />
    <Footer/>
  </div>
</template>
