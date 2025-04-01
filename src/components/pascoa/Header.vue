<template>
  <header class="bg-gradient-to-b from-brown-600 to-brown-700 text-white py-6">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center">
        <img
          src="https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&q=80&w=200"
          alt="Doces Tatá"
          class="w-32 h-32 rounded-full border-4 border-pink-200 object-cover"
        />
        <div class="flex flex-col md:flex-row gap-4">
          <a
            href="https://instagram.com/docestata_"
            target="_blank"
            class="flex items-center gap-2 bg-pink-500 hover:bg-pink-600 px-4 py-2 rounded-full transition-colors"
          >
            <Instagram class="w-5 h-5" />
            <span>@docestata_</span>
          </a>
          <a
            href="https://wa.me/5528999944690"
            target="_blank"
            class="flex items-center gap-2 bg-green-500 hover:bg-green-600 px-4 py-2 rounded-full transition-colors"
          >
            <img class="w-5 h-5" src="/whats-app.svg" />
            <span>Pedidos</span>
          </a>
        </div>
      </div>
    </div>
  </header>
</template>

<script lang="ts" setup>
import { Instagram } from "lucide-vue-next";

</script>
