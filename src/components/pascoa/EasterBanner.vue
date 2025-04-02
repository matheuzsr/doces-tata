<template>
  <div class="bg-gradient-to-r from-pink-200 to-pink-300 py-12 text-center">
    <h1 class="text-4xl md:text-6xl font-bold text-brown-800 mb-4">Páscoa Especial 2025</h1>
    <p class="text-xl text-brown-600 max-w-2xl mx-auto px-4">
      Celebre a Páscoa com nossos doces artesanais feitos com muito amor e carinho.
    </p>
    <div class="mt-6">
      <Egg class="inline-block w-12 h-12 text-brown-700 animate-bounce" />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { Egg } from 'lucide-vue-next'
</script>
