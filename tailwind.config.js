/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        brown: {
          600: '#795548',
          700: '#5d4037',
          800: '#4e342e',
        },
      },
    },
  },
  plugins: [],
}
