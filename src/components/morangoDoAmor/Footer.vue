<template>
  <footer class="bg-strawberry-700 text-white py-8">
    <div class="container mx-auto px-4 text-center">
      <p class="text-lg mb-4">Faça sua encomenda com antecedência!</p>
      <div class="flex justify-center gap-4 mb-6">
        <a
          href="https://www.instagram.com/docestata___"
          target="_blank"
          class="hover:text-pink-300 transition-colors"
          aria-label="Visitar o perfil do Instagram @docestata___"
          title="Visitar o perfil do Instagram @docestata___"
        >
          <Instagram class="w-6 h-6" />
        </a>
        <a
          href="https://wa.me/5528999944690"
          target="_blank"
          class="flex items-center gap-2 hover:text-green-300 transition-colors"
          title="Fazer pedido pelo WhatsApp"
          aria-label="Fazer pedido pelo WhatsApp"
        >
          <img class="w-6 h-6" src="/whats-app.svg" alt="whats-app-button" />
          (28)99994-4690
        </a>
      </div>
      <div
        class="inline-flex items-center justify-center mt-4 py-2 px-4 rounded-lg bg-strawberry-800 text-sm opacity-80 hover:opacity-100 transition-all"
      >
        <span class="mr-2">Created by</span>
        <div class="flex items-center gap-3">
          <a
            href="https://www.linkedin.com/in/matheuzsr/"
            target="_blank"
            class="flex items-center gap-1 hover:text-blue-300 transition-colors"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="currentColor"
              class="w-5 h-5"
            >
              <path
                d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14m-.5 15.5v-5.3a3.26 3.26 0 00-3.26-3.26c-.85 0-1.84.52-2.32 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 011.4 1.4v4.93h2.79M6.88 8.56a1.68 1.68 0 001.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 00-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37h2.77z"
              />
            </svg>
            <span class="hover:underline">/matheuzsr</span>
          </a>
          <a
            href="https://github.com/matheuzsr"
            target="_blank"
            class="flex items-center gap-1 hover:text-gray-300 transition-colors"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="currentColor"
              class="w-5 h-5"
            >
              <path
                d="M12 2C6.477 2 2 6.477 2 12c0 4.42 2.865 8.167 6.839 9.489.5.092.682-.217.682-.48 0-.237-.008-.866-.013-1.7-2.782.603-3.369-1.342-3.369-1.342-.454-1.155-1.11-1.462-1.11-1.462-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.029-2.683-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.699 1.028 1.592 1.028 2.683 0 3.841-2.337 4.687-4.565 4.935.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.743 0 .267.18.578.688.48C19.138 20.161 22 16.416 22 12c0-5.523-4.477-10-10-10z"
              />
            </svg>
            <span class="hover:underline">/matheuzsr</span>
          </a>
        </div>
      </div>
    </div>
  </footer>
</template>

<script lang="ts" setup>
import { Instagram } from 'lucide-vue-next'
</script>
