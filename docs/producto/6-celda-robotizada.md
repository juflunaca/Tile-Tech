# Celda Robótica

Para el diseño de la celda robótica se siguió la siguiente ruta:

![diseno](https://github.com/juflunaca/Tile-Tech/assets/55969494/f7e5525f-650c-4970-a029-5d69ff3e62cf)


## Estudio del proceso

Teniendo en cuenta las diferentes fases del proceso de producción, se identificó que un área donde se puede implementar la celda robótica es en la paletización de los productos.

La paletización es un proceso por el cual se coloca la mercancía apilada en un palet para su posterior manipulación, almacenaje y/o transporte. Para ello, se siguen los siguientes pasos:

a.	Carga y agrupación de la mercancía sobre el palet de una forma uniforme
b.	Centralizar al máximo el peso de la mercancía en el palet
c.	Se puede incluir algún otro material de embalaje entre los bultos para evitar que se rompan o desestabilicen, como por ejemplo separadores de cartón

### Aspectos a tener en cuenta

1. **Estriba o palet:** Es un elemento fabricado en madera en forma de plataforma que permite el paletizado de los productos haciendo más fácil su manejo. Una estiba o tarima debe soportar una carga máxima de 1.200 Kg. [1]. Sus medidas estándar son comunmente el europalet (1200x800 mm) o el palet isopalet (1200x1000 mm).

2. **Estabilidad de la carga:** Si la estabilidad del estibado no se puede lograr mediante el uso de elementos como zunchos, esquineros, plástico strech u otros mecanismos de inmovilización, se recomienda realizar el cruzamiento de las cajas en los dos o tres últimos niveles del estibado.

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/b45eb812-3549-4880-a62c-dcb269593959)

_Tomado de [1]_

3. **Acomodación de las cajas:** Cuando se acomoden las cajas en la estiba evitar las siguientes situaciones, ya que los productos pueden sufrir daños y se generarían roturas en el momento que se transporta y almacena.
![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/e57af90e-c471-4f45-90ee-07cb1041d31e)

_Tomado de [1]_

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/d2f944bd-b116-4560-ac54-18e49aa5e36a)

_Tomado de [1]_

4. **Altura máxima del arrume:** No sobrepasar el arrume a alturas mayores de 1.05 cm. incluyendo la estiba (Altura de arrume: 90 cm + Altura de estiba: 14 cm.) Esta altura esta basada en las dimensiones generales de camiones, contenedores y otros lugares de almacenamiento.

## Subdivisión de tareas

Teniendo el proceso en cuenta, se dividió el proceso en tareas realizables por el robot:

1.  Mover robot a la banda transportadora
2.	Acercar el robot a la caja
3.	Agarrar la caja
4.	Levantar la caja
5.	Mover la caja hasta el palet
6.	Ubicar la caja en el palet
7.	Retornar robot a la banda transportadora

## Diagrama de flujo

A partir del punto anterior, se realizó un diagrama de flujo relacionando las tareas.

![diagrama_flujo](https://github.com/juflunaca/Tile-Tech/assets/55969494/bef9a7a3-75ce-48cb-a692-8b903ea81834)

## Lista de máquinas y otros elementos

Con esto en mente, se identificaron las máquinas y elementos que irán en la celda robótica

1. Robot
2. Controlador del robot
3. Palet Americano
4. Banda transportadora

## Alternativas de Layout

Una vez identificados todos los elementos y las operaciones a realizar, se proponen 3 alternativas de layout para la celda robótica:

### Alternativa 1
![O1](https://github.com/juflunaca/Tile-Tech/assets/55969494/dc386494-cc86-4131-9ba6-3b89bc4ca2a8)

### Alternativa 2
![O2](https://github.com/juflunaca/Tile-Tech/assets/55969494/e90249cf-e19a-4e6e-83f8-27d5315d76d2)

### Alternativa 3
![O3](https://github.com/juflunaca/Tile-Tech/assets/55969494/bb494ce3-39a6-4d63-bbf6-a1c60aa78eb6)


## Referencias

1. Corona. 2010. Manual para la manipulación de productos: Decorados & Complementos. [Manual](https://www.megamafers.com/wp-content/uploads/2015/06/Lacasitos.pdf)
