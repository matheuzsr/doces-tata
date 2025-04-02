<template>
  <header class="bg-gradient-to-b from-brown-600 to-brown-700 text-white py-6">
    <div class="container mx-auto px-6">
      <div class="flex justify-between items-center">
        <img
          src="/logo.jpeg"
          alt="Doces Tatá"
          class="w-28 h-28 rounded-full border-4 border-pink-200 object-cover"
        />

        <div class="flex flex-col-reverse md:flex-row gap-4">
          <a
            href="https://www.instagram.com/docestata___"
            target="_blank"
            class="flex items-center gap-2 bg-pink-600 hover:bg-pink-700 text-white font-medium px-4 py-2 rounded-full transition-colors
"
          >
            <Instagram class="w-5 h-5" />
            <span>@docestata___</span>
          </a>
          <a
            href="https://wa.me/5528999944690"
            target="_blank"
            class="flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white font-medium px-4 py-2 rounded-full transition-colors"
          >
            <img class="w-5 h-5" src="/whats-app.svg" alt="whats-app-button" />
            <span>Pedidos</span>
          </a>
        </div>
      </div>
    </div>
  </header>
</template>

<script lang="ts" setup>
import { Instagram } from 'lucide-vue-next'
</script>
