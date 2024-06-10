import { defineConfig } from 'vitepress'
import footnote from 'markdown-it-footnote'
import { config } from "dotenv";
import { withMermaid, MermaidConfig, MermaidPluginConfig } from "vitepress-plugin-mermaid";


config();

const mermaidConfig: MermaidConfig = {
  // Refer to MermaidAPI configuration options
  // For example:
  theme: 'default', // or 'dark', etc.
  startOnLoad: true,
  // Add other Mermaid configuration options here
};

// Define your Mermaid Plugin configuration
const mermaidPluginConfig: MermaidPluginConfig = {
  class: "mermaid my-class", // set additional CSS classes for parent container
};

// https://vitepress.dev/reference/site-config
export default defineConfig(
  withMermaid({
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
          { text: 'Análisis para el diseño', link: '/producto/1-analisis-disenio'},
          { text: 'Definición de producto', link: '/producto/2-definicion-de-productos'},
          { text: 'Gestión de producción', link: '/producto/5-gestion-produccion'},
          { text: 'Propuesta de automatización', link: '/producto/4-propuesta'},
          { text: 'Análisis económico', link: '/producto/3-analisis-economico'},
          { text: 'Celda robotizada', link: '/producto/6-celda-robotizada' },
          { text: 'Programación de PLCs', link: '/producto/7-PLC' },
          { text: 'Gemelo digital', link: '/producto/8-transformacion-digital'},
          { text: 'SCADA', link: '/producto/9-SCADA' },
          { text: 'Integración de sistemas', link: '/producto/10-integracion' }
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
  },
  // Add Mermaid configuration
  mermaid: mermaidConfig,
  // Add Mermaid Plugin configuration
  mermaidPlugin: mermaidPluginConfig,
})

)

/*

export default {
  ...DefaultTheme,
  enhanceApp({ app }) {
    app.component('TeamMember', TeamMember)
  }
}
*/
