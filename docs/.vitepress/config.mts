import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Tile tech",
  description: "Tile tech is a automation proposal to improve the production process of ceramic plant",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Página principal', link: '/' },
      { text: 'Producto', link: '/producto/index' },
      { text: 'Proceso', link: '/proceso/index' }

    ],

    sidebar: [
      {
        text: 'Producto',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'Runtime API Examples', link: '/api-examples' }
        ]
      },
      {
        text: 'Proceso',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'Runtime API Examples', link: '/api-examples' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/juflunaca/Tile-Tech' }
    ]
  }
})
