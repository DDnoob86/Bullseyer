import { defineConfig } from 'tailwindcss';
export default defineConfig({
  content: ['./src/**/*.{html,svelte,js,ts}'],
  theme: { extend: { colors: { primary: '#1d4ed8' } } },
  plugins: []
});
