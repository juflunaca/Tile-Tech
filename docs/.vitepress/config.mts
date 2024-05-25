import { defineConfig } from 'vitepress'
import { config } from "dotenv";

config();


// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Tile tech",
  description: "Tile tech is a automation proposal to improve the production process of ceramic plant",
  base: process.env.BASE_PATH ??'/Tile-Tech/',
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Página principal', link: '/' },
      { text: 'Producto', link: '/producto/index' },
      { text: 'Proceso', link: '/proceso/index' }

    ],

    sidebar: [
      {
        text: 'Proceso',
        items: [
          { text: 'Planeación y gestión', link: '/proceso/1-planeacion-y-gestion' },
          { text: 'Comunicaciones', link: '/proceso/comunicaciones' },
          { text: 'Cronograma', link: '/proceso/cronograma' }
        ]
      },
      {
        text: 'Producto',
        items: [
          { text: 'Análisis de diseño', link: '/producto/analisis-disenio'},
          { text: 'Definición de producto', link: '/producto/definicion-de-productos'},
          { text: 'Celda robotizada', link: '/producto/3-celdas-robotizadas' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/juflunaca/Tile-Tech' }
    ]
  },
  outDir: '../dist'
})
