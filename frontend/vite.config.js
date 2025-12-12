import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

const backendTarget = 'http://34.200.15.126:3000'

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    proxy: {
      '/usuario': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Especies': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Razas': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Servicios': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Citas': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Recordatorios': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/login': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Roles': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
      '/Veterinarios': {
        target: backendTarget,
        changeOrigin: true,
        secure: false,
      },
    },
  },
})
