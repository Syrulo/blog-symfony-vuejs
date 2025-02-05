import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    host: '0.0.0.0',  // Ecoute toutes les connexions réseau
    port: 5173,        // Tu peux définir le port ici aussi
    proxy: {
      '/api': {
        target: 'http://symfony:8080',  // Remplace par le nom de ton service backend dans docker-compose.yml
        changeOrigin: true,
        secure: false,
      },
    },
    hmr: {
      host: 'localhost',  // Assurez-vous que Vite communique correctement
      port: 5173,
      protocol: 'ws',
    },
    watch: {
      usePolling: true,  // Utilisation de "polling" pour les fichiers modifiés dans Docker
    },
  }
})
