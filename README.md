# Tile-Tech

Propuesta de automatización para un proceso de producción de baldosas cerámicas desarrollado por estudiantes de la Universidad Nacional de Colombia.

* Andres Sebastian Serna Montano
* Valentina Hernandez Montes
* Juan Sebastian Dueñas Salamanca
* Julian Felipe Luna Castro


## [Pagina web](https://juflunaca.github.io/Tile-Tech/)

## Getting started 

La documentación del proyecto fue creada usando vitepress. una libreria de Vue utilizando node js y sistema de empaque `yarn`. Puedes seguir la siguiente guía de [como comenzar a usar vitepress](https://vitepress.dev/guide/getting-started)

### Pre requisito

Tener instalado node js y yarn

### Comenzar
Para instalar la libreria de vitepress

```
yarn add -D vitepress
```

Para hacer un despligue local para prueba de resultados

```
yarn run docs:dev
```

## Development

pre-commit hooks


```bash
echo 'yarn docs:build' > .git/hooks/pre-commit
```