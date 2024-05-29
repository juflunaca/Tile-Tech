import { defineConfig } from 'vitepress'
import footnote from 'markdown-it-footnote'
import { config } from "dotenv";

config();


// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Tile tech",
  description: "Tile tech is a automation proposal to improve the production process of ceramic plant",
  base: process.env.BASE_PATH ??'/Tile-Tech/',
  head: [
    ['link', { rel: 'icon', href: '/Tile-Tech/tile-tech-logo.ico' }]],

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Página principal', link: '/' },
      { text: 'Proceso', link: '/proceso/index'},
      { text: 'Producto', link: '/producto/index' }

    ],

    sidebar: [
      {
        text: 'Proceso', link: '/proceso/index',
        items: [
          { text: 'Planeación y gestión', link: '/proceso/1-planeacion-y-gestion' },
          { text: 'Comunicaciones entre partes', link: '/proceso/2-comunicaciones' },
          { text: 'Cronograma', link: '/proceso/3-cronograma' },
          { text: 'Proceso de aprendizaje', link: '/proceso/4-proceso-de-aprendizaje' }
        ]
      },
      {
        text: 'Producto', link: '/producto/index',
        items: [
          { text: 'Análisis de diseño', link: '/producto/1-analisis-disenio'},
          { text: 'Definición de producto', link: '/producto/2-definicion-de-productos'},
          { text: 'Análisis económico', link: '/producto/3-analisis-economico'},
          { text: 'Propuesta de automatización', link: '/producto/4-propuesta'},
          { text: 'Gestión de producción', link: '/producto/5-gestion-produccion'},
          { text: 'Celda robotizada', link: '/producto/6-celda-robotizada' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/juflunaca/Tile-Tech' }
    ]
  },
  outDir: '../dist',
  markdown: {
    math: true,
    config: (md) => {
      md.use(footnote)
      
    }
  }
})

/*

export default {
  ...DefaultTheme,
  enhanceApp({ app }) {
    app.component('TeamMember', TeamMember)
  }
}
*/
