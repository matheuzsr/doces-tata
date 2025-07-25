<template>
  <div class="container mx-auto px-4 py-16">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <template v-if="loading">
        <div
          v-for="index in 6"
          :key="index"
          class="bg-white rounded-2xl shadow-xl overflow-hidden animate-pulse"
        >
          <div class="h-80 bg-gray-200"></div>
          <div class="p-6">
            <div class="h-6 bg-gray-200 mb-2 rounded-md"></div>
            <div class="h-4 bg-gray-200 mb-4 rounded-md"></div>
            <div class="h-4 bg-gray-200 mb-4 rounded-md"></div>
            <div class="h-4 bg-gray-200 mb-4 rounded-md"></div>
            <div class="h-6 bg-gray-200 mb-4 rounded-md"></div>
          </div>
        </div>
      </template>
      <template v-else>
        <div
          v-for="item in items"
          :key="item.id"
          class="bg-white rounded-2xl shadow-xl overflow-hidden transform hover:scale-105 transition-transform"
        >
          <img
            :src="item?.image_url"
            :alt="`product-image-${item.name}`"
            class="w-full h-80 object-cover"
          />
          <div class="p-6">
            <span class="text-2xl font-bold text-brown-800 mb-2">
              {{ item.name }}
            </span>
            <p class="text-gray-600 mb-4">{{ item.description }}</p>
            <div class="flex items-center flex-wrap">
              <span
                v-for="(flavor, index) in item.flavors"
                :key="index"
                class="py-1 text-slate-500 text-sm"
              >
                <span class="text-wrap">
                  {{ flavor }}
                  <span v-if="item.flavors.length - 1 !== index" class="mx-1">|</span>
                </span>
              </span>
            </div>
            <div class="flex flex-wrap gap-2 mb-4">
              <span
                v-for="size in item.sizes"
                :key="size"
                class="px-3 my-1 bg-pink-100 text-pink-700 rounded-full text-sm"
              >
                {{ size }}
              </span>
            </div>

            <div class="flex justify-between items-center">
              <span class="text-2xl font-bold text-brown-800">{{ formatMoney(item?.price) }}</span>
              <a
                :href="getURL(item)"
                target="_blank"
                class="orderButton bg-green-600 hover:bg-green-700 text-white font-medium px-4 py-2 rounded-full flex items-center gap-2 transition-colors"
              >
                <img class="w-5 h-5" src="/whats-app.svg" alt="whats-app-button" />
                Encomendar
              </a>
            </div>
          </div>
        </div>
      </template>
    </div>
  </div>
</template>

<script lang="ts" setup>
export interface EasterItems {
  id: string
  name: string
  description: string
  price: number
  image_url: string
  sizes: string[]
  flavors: string
}
defineProps<{ items: EasterItems[]; loading: boolean }>()

function getURL(product: EasterItems) {
  const phoneNumber = '5528999944690'
  const price = formatMoney(product.price)

  const eggEmoji = '\uD83E\uDD5A' // 🥚
  const pinEmoji = '\uD83D\uDCCC' // 📌
  const moneyEmoji = '\uD83D\uDCB0' // 💰

  const message =
    `Olá, Tata! Gostaria de encomendar:\n\n` +
    `*${eggEmoji} ${product.name}*\n` +
    `${pinEmoji} *${product.description}*\n` +
    `${moneyEmoji} *Valor:* ${price}\n` +
    `Podemos seguir com o pedido?`

  return `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`
}

function formatMoney(price: number) {
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  }).format(price)
}
</script>
