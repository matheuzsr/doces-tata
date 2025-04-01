<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { supabase } from '../lib/supabase';
import { PlusCircle, Trash2, Save, Upload } from 'lucide-vue-next';

interface Category {
  id: string;
  name: string;
}

interface Product {
  id: string;
  name: string;
  description: string;
  price: number;
  image_url: string;
  sizes: string[];
  categories: string[];
}

const categories = ref<Category[]>([]);
const products = ref<Product[]>([]);
const newProduct = ref({
  name: '',
  description: '',
  price: 0,
  image_url: '',
  sizes: [''],
  categories: [],
});

const loadCategories = async () => {
  const { data, error } = await supabase
    .from('categories')
    .select('*');
  
  if (error) {
    console.error('Error loading categories:', error);
    return;
  }
  
  categories.value = data;
};

const loadProducts = async () => {
  const { data: productsData, error: productsError } = await supabase
    .from('products')
    .select(`
      *,
      product_sizes (size),
      product_categories (category_id)
    `);
  
  if (productsError) {
    console.error('Error loading products:', productsError);
    return;
  }
  
  products.value = productsData.map(product => ({
    ...product,
    sizes: product.product_sizes.map(s => s.size),
    categories: product.product_categories.map(c => c.category_id),
  }));
};

const handleImageUpload = async (event: Event, productId?: string) => {
  const file = (event.target as HTMLInputElement).files?.[0];
  if (!file) return;

  const fileExt = file.name.split('.').pop();
  const fileName = `${Math.random()}.${fileExt}`;
  const filePath = `${fileName}`;

  const { error: uploadError, data } = await supabase.storage
    .from('product-images')
    .upload(filePath, file);

  if (uploadError) {
    console.error('Error uploading image:', uploadError);
    return;
  }

  const { data: { publicUrl } } = supabase.storage
    .from('product-images')
    .getPublicUrl(filePath);

  if (productId) {
    // Update existing product
    const { error } = await supabase
      .from('products')
      .update({ image_url: publicUrl })
      .eq('id', productId);
    
    if (error) {
      console.error('Error updating product image:', error);
      return;
    }
  } else {
    // New product
    newProduct.value.image_url = publicUrl;
  }

  await loadProducts();
};

const saveProduct = async () => {
  // Insert new product
  const { data: product, error: productError } = await supabase
    .from('products')
    .insert({
      name: newProduct.value.name,
      description: newProduct.value.description,
      price: newProduct.value.price,
      image_url: newProduct.value.image_url,
    })
    .select()
    .single();

  if (productError) {
    console.error('Error creating product:', productError);
    return;
  }

  // Insert sizes
  const sizesData = newProduct.value.sizes.map(size => ({
    product_id: product.id,
    size,
  }));

  const { error: sizesError } = await supabase
    .from('product_sizes')
    .insert(sizesData);

  if (sizesError) {
    console.error('Error creating sizes:', sizesError);
    return;
  }

  // Insert categories
  const categoriesData = newProduct.value.categories.map(categoryId => ({
    product_id: product.id,
    category_id: categoryId,
  }));

  const { error: categoriesError } = await supabase
    .from('product_categories')
    .insert(categoriesData);

  if (categoriesError) {
    console.error('Error creating categories:', categoriesError);
    return;
  }

  // Reset form and reload products
  newProduct.value = {
    name: '',
    description: '',
    price: 0,
    image_url: '',
    sizes: [''],
    categories: [],
  };
  
  await loadProducts();
};

const deleteProduct = async (id: string) => {
  const { error } = await supabase
    .from('products')
    .delete()
    .eq('id', id);

  if (error) {
    console.error('Error deleting product:', error);
    return;
  }

  await loadProducts();
};

onMounted(() => {
  loadCategories();
  loadProducts();
});
</script>

<template>
  <div class="min-h-screen bg-pink-50 p-8">
    <div class="max-w-6xl mx-auto">
      <h1 class="text-3xl font-bold text-brown-800 mb-8">Gerenciamento de Produtos</h1>

      <!-- Add New Product Form -->
      <div class="bg-white rounded-lg shadow-lg p-6 mb-8">
        <h2 class="text-xl font-semibold text-brown-700 mb-4">Adicionar Novo Produto</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Nome</label>
            <input
              v-model="newProduct.name"
              type="text"
              class="w-full px-3 py-2 border rounded-md"
            >
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Preço</label>
            <input
              v-model="newProduct.price"
              type="number"
              step="0.01"
              class="w-full px-3 py-2 border rounded-md"
            >
          </div>

          <div class="md:col-span-2">
            <label class="block text-sm font-medium text-gray-700 mb-2">Descrição</label>
            <textarea
              v-model="newProduct.description"
              rows="3"
              class="w-full px-3 py-2 border rounded-md"
            ></textarea>
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Imagem</label>
            <input
              type="file"
              accept="image/*"
              @change="handleImageUpload"
              class="w-full"
            >
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">Categorias</label>
            <select
              v-model="newProduct.categories"
              multiple
              class="w-full px-3 py-2 border rounded-md"
            >
              <option v-for="category in categories" :key="category.id" :value="category.id">
                {{ category.name }}
              </option>
            </select>
          </div>

          <div class="md:col-span-2">
            <label class="block text-sm font-medium text-gray-700 mb-2">Tamanhos</label>
            <div class="flex flex-wrap gap-2">
              <div v-for="(size, index) in newProduct.sizes" :key="index" class="flex items-center gap-2">
                <input
                  v-model="newProduct.sizes[index]"
                  type="text"
                  class="px-3 py-2 border rounded-md"
                >
                <button
                  @click="newProduct.sizes.splice(index, 1)"
                  class="text-red-500"
                  v-if="newProduct.sizes.length > 1"
                >
                  <Trash2 class="w-5 h-5" />
                </button>
              </div>
              <button
                @click="newProduct.sizes.push('')"
                class="text-green-500"
              >
                <PlusCircle class="w-5 h-5" />
              </button>
            </div>
          </div>
        </div>

        <button
          @click="saveProduct"
          class="mt-6 bg-green-500 text-white px-6 py-2 rounded-md hover:bg-green-600 flex items-center gap-2"
        >
          <Save class="w-5 h-5" />
          Salvar Produto
        </button>
      </div>

      <!-- Products List -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div
          v-for="product in products"
          :key="product.id"
          class="bg-white rounded-lg shadow-lg overflow-hidden"
        >
          <img
            :src="product.image_url"
            :alt="product.name"
            class="w-full h-48 object-cover"
          >
          <div class="p-6">
            <h3 class="text-xl font-semibold text-brown-700 mb-2">{{ product.name }}</h3>
            <p class="text-gray-600 mb-4">{{ product.description }}</p>
            <p class="text-lg font-bold text-brown-800 mb-4">R$ {{ product.price.toFixed(2) }}</p>
            
            <div class="flex flex-wrap gap-2 mb-4">
              <span
                v-for="size in product.sizes"
                :key="size"
                class="px-3 py-1 bg-pink-100 text-pink-700 rounded-full text-sm"
              >
                {{ size }}
              </span>
            </div>

            <div class="flex justify-between items-center">
              <input
                type="file"
                accept="image/*"
                @change="(e) => handleImageUpload(e, product.id)"
                class="text-sm"
              >
              <button
                @click="deleteProduct(product.id)"
                class="text-red-500 hover:text-red-600"
              >
                <Trash2 class="w-5 h-5" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>