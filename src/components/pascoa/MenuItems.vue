<template>
  <!-- Menu Items -->
  <div class="container mx-auto px-4 py-16">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
      <div
        v-for="item in items"
        :key="item.id"
        class="bg-white rounded-2xl shadow-xl overflow-hidden transform hover:scale-105 transition-transform"
      >
        <img
          :src="item?.image_url"
          :alt="item.name"
          class="w-full h-80 object-cover"
        />
        <div class="p-6">
          <h3 class="text-2xl font-bold text-brown-800 mb-2">
            {{ item.name }}
          </h3>
          <p class="text-gray-600 mb-4">{{ item.description }}</p>
          <div class="flex items-center flex-wrap">
            <span
              v-for="(flavor, index) in item.flavors"
              :key="index"
              class="py-1 text-slate-500 text-sm"
            >
              <span class="text-wrap">
                {{ flavor }}
                <span v-if="item.flavors.length - 1 !== index" class="mx-1"
                  >|</span
                >
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
            <span class="text-2xl font-bold text-brown-800">{{
              formatMoney(item?.price)
            }}</span>
            <a
              :href="getURL(item)"
              target="_blank"
              class="bg-green-500 hover:bg-green-600 text-white px-4 py-2 rounded-full flex items-center gap-2 transition-colors"
            >
              <img class="w-5 h-5" src="/whats-app.svg" />
              Encomendar
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
export interface EasterItems {
  id: string;
  name: string;
  description: string;
  price: number;
  image_url: string;
  sizes: string[];
  flavors: string;
}
defineProps<{ items: EasterItems[] }>();

function getURL(product: EasterItems) {
  const phoneNumber = "5528999944690";
  // Format com intl para BRL
  const price = formatMoney(product.price);

  const message =
    `Olá, Tata! Gostaria de encomendar:\n\n` +
    `*🥚 ${product.name}*\n` +
    `📌 *${product.description}*\n` +
    `💰 *Valor:* ${price}\n` +
    `Podemos seguir com o pedido?`;

  return `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`;
}

function formatMoney(price: number) {
  return new Intl.NumberFormat("pt-BR", {
    style: "currency",
    currency: "BRL",
  }).format(price)
}
</script>
