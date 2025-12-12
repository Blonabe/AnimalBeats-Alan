import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), 'VITE_')
  const backendTarget = env.VITE_API_URL || 'http://localhost:3000'

  return {
    plugins: [react()],
    server: {
      host: true,
      proxy: {
        '/usuario': { target: backendTarget, changeOrigin: true, secure: false },
        '/Especies': { target: backendTarget, changeOrigin: true, secure: false },
        '/Razas': { target: backendTarget, changeOrigin: true, secure: false },
        '/Servicios': { target: backendTarget, changeOrigin: true, secure: false },
        '/Citas': { target: backendTarget, changeOrigin: true, secure: false },
        '/Recordatorios': { target: backendTarget, changeOrigin: true, secure: false },
        '/login': { target: backendTarget, changeOrigin: true, secure: false },
        '/Roles': { target: backendTarget, changeOrigin: true, secure: false },
        '/Veterinarios': { target: backendTarget, changeOrigin: true, secure: false },
      },
    },
  }
})
