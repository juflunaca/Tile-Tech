# Tile-Tech

Propuesta de automatización para un proceso de producción de baldosas cerámicas desarrollado por estudiantes de la Universidad Nacional de Colombia.

* Andres Sebastian Serna Montano
* Valentina Hernandez Montes
* Juan Sebastian Dueñas Salamanca
* Julian Felipe Luna Castro


## [Pagina web](https://juflunaca.github.io/Tile-Tech/)

## [Presentación final](https://www.canva.com/design/DAGGuu8GF00/jsUdxK0FUb3DmUeXHuyDIw/view?utm_content=DAGGuu8GF00&utm_campaign=designshare&utm_medium=link&utm_source=editor)

## Getting started 

La documentación del proyecto fue creada usando vitepress. una libreria de Vue utilizando node js y sistema de empaque `yarn`. Puedes seguir la siguiente guía de [como comenzar a usar vitepress](https://vitepress.dev/guide/getting-started)

### Pre requisito

Tener instalado node js y `yarn`

### Comenzar
Para instalar la libreria de vitepress

```
yarn add -D vitepress
```

Para hacer un despliegue local para prueba de resultados

```
yarn run docs:dev
```

## Development

## autodeployment de github actions

Para hacer un despliegue automatico de la pagina web en github pages se configuró un archivo de github actions en la carpeta [.github/workflows/deploy.yml](.github/workflows/deploy.yml) donde se construye el sitio web. Este es activado por commits a la rama main o ramas que comiencen por `docs/*`.

## pre-commit hooks

Es fácil cometer errores que al momento de hacer un commit, para evitar esto se puede configurar un hook de pre-commit que ejecute un comando antes de hacer el commit. En este caso se ejecuta el comando `yarn docs:build` para verificar que la documentación se construye correctamente. Si se produce un error no se realiza el commit.  En la experiencia del equipo se observo que un error común era generar links rotos. Esto chequeo previo previene subir este tipo de errores.

```bash
echo 'yarn docs:build' > .git/hooks/pre-commit
```