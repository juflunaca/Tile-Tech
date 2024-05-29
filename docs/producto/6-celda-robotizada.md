# Celda Robótica

Para el diseño de la celda robótica se siguió la siguiente ruta:

![diseno_celda](https://github.com/juflunaca/Tile-Tech/assets/55969494/b8df7e7d-288f-417f-8385-bd9d8e6847db)

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

5.  **Organización del palet:** Teniendo en cuenta las dimensiones del palet, la carga máxima que soporta y la altura máxima recomendada, se define que el palet se organizará de forma que cuente con 80 cajas. Esto resulta en un palet con las siguientes características:
   
   | Característica | Especificaciones |
   | -------------- | -----------------|
   | Peso Total | 1044 Kg |
   | Altura total (incluyendo altura del palet | 952.4 mm |
   | Cantidad de cajas por palet | 80 |
   | Superficie del palet usada | 100% |

   ![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/e2ec244c-e2d5-4913-916f-af95fccfe70b)

   Simulación realizada con [Calculadora y configurador de pallets](https://www.ptchronos.com/es/calculadora-de-pallets)

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

A partir del punto anterior, se realizó un diagrama de flujo relacionando las tareas.}

![flujo](https://github.com/juflunaca/Tile-Tech/assets/55969494/da066e21-11cb-40f5-ba46-27a2c7b40ddc)

## Lista de máquinas y otros elementos

Con esto en mente, se identificaron las máquinas y elementos que irán en la celda robótica

1. Robot
2. Controlador del robot
3. Palet Americano
4. Banda transportadora

### Selección de equipos

Se tuvo en cuenta la selcción del gripper. En este caso, se tuvieron en cuenta los siguientes aspectos principalmente:

| Característica | Especificaciones |
| ---------------| -----------------|
| Capacidad de carga | Mayor a 13 Kg |
| Rango de agarre | Mayor a 15 mm |
| Peso | El menor peso posible |

Con esto en mente, y revisando diferentes opciones de gripper para paletizado en el mercado, se decidió por el gripper **Onrobot 2FGP20**. 

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/a475ffa4-7ee1-4f8d-981e-f7639e3cefa6)

Los datos técnicos se pueden encontrar en: [2FGP20 Datasheet](https://onrobot.com/sites/default/files/documents/Datasheet_2FGP20_EN_1.pdf)

Para seleccionar el robot a utilizar en la celda, se tuvieron en cuenta los siguientes aspectos principalmente:

| Característica | Especificaciones |
| ---------------| -----------------|
| Capacidad de carga | Mayor a 18 Kg (caja + gripper) |
| Alcance | Mayor a 1200 mm |
| Costo | El menor costo posible |

Con esto en mente, se obtuvieron diferentes opciones: 
1. KR 22 R1610-2
2. Fanuc M-20iB/25
3. Yaskawa GP20HL

Revisando las características de los robots, se seleccionó el robot Kuka KR22 R1610-2:

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/ddd5089b-35da-4a2f-8567-270f4eead2d6)

Área de trabajo

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/337b4fe1-496e-40e7-8705-8ff6a37cb63b)

Los datos técnicos pueden encontrarse aquí: [KR22 R1610-2 Datos Técnicos](https://www.kuka.com/-/media/kuka-downloads/imported/8350ff3ca11642998dbdc81dcc2ed44c/0000321011_es.pdf?rev=ea0b3ca65413451aab3208293739e619&hash=07B8DCCE4871A89E582997C3F8BB4971)

Una vez seleccionado el robot, se revisó la documentación de Kuka para seleccionar el controlador. De esta manera, se seleccionó el controlador KR C5:

![image](https://github.com/juflunaca/Tile-Tech/assets/55969494/a584eee7-7987-4549-a71c-9fd46b409086)

Los datos técnicos pueden encontrarse en: [KRC5](https://www.kuka.com/-/media/kuka-downloads/imported/87f2706ce77c4318877932fb36f6002d/kuka_kr_c5_en.pdf?rev=6209cd039c4a4716b0d1e7e67a4010a9&hash=4B878D33601BDE6539C52A52CB0CE88A)

## Alternativas de Layout

Una vez identificados todos los elementos y las operaciones a realizar, se proponen 3 alternativas de layout para la celda robótica:

### Alternativa 1
![O1](https://github.com/juflunaca/Tile-Tech/assets/55969494/9f05ab70-eb70-4630-9c70-ca17ab1299a7)

### Alternativa 2
![O2](https://github.com/juflunaca/Tile-Tech/assets/55969494/e90249cf-e19a-4e6e-83f8-27d5315d76d2)

### Alternativa 3
![O3](https://github.com/juflunaca/Tile-Tech/assets/55969494/bb494ce3-39a6-4d63-bbf6-a1c60aa78eb6)

## Selección de la mejor alternativa



## Seguridad

### Gestión de Riesgo
Análisis de Regulaciones

| Norma | Tema | A tener en cuenta |
| ----- | ---- | ----------------- |
| OSHA Standards 1910 Subparte D | Cubre las superficies de trabajo para caminar y los requisitos generales. Las superficies de trabajo y tránsito deben estar libres de peligros conocidos que puedan causar caídas, resbalones o tropiezos. | Implementar barandillas, escaleras seguras, y superficies antideslizantes.|
| OSHA Standards 1910 Subparte G | Aborda la salud ocupacional y el control ambiental, incluida la exposición al ruido ocupacional (1910.95) | Los empleados no deben estar expuestos a un nivel de ruido superior a 90 decibelios ponderados A (dBA) durante un período de 8 horas de trabajo<sup>1</sup>.|
| OSHA Standards 1910 Subparte I | Relativo a los equipos de protección personal. | Cascos, guantes, gafas de seguridad. |
| OSHA Standards 1910 Subparte J | Se enfoca en los controles ambientales generales, incluidos los procedimientos de bloqueo/etiquetado (1910.147). | Implementar procedimientos de bloqueo y etiquetado para evitar la activación accidental de equipos durante el mantenimiento. |
| OSHA Standards 1910 Subparte O | Trata de la maquinaria y la protección de las máquinas, especificando los requisitos para la protección de los trabajadores | Instalar resguardos que protejan a los trabajadores de puntos de operación peligrosos y piezas móviles. Utilizar barreras físicas, cortinas de luz, y dispositivos de enclavamiento<sup>2</sup>. |
| OSHA Standards 1910 Subparte S | Prácticas de trabajo eléctrico. | Dispositivos de Protección contra Sobrecorriente y Sistemas de Puesta a Tierra. |
| ANSI/ISO 12100-2012 | Principles for Machinery Safety Design | Identificación de peligros, evaluación de riesgos, y reducción de riesgos mediante diseño inherente seguro, medidas de protección, y señales de advertencia. |

<sup> 1</sup> Asumiendo una fuente de 95dBA a una distancia de referencia de 1 metro, podemos calcular la distancia segura con la fórmula de atenuación del ruido: L2 = L1 - 20Log10(r2/r1), donde L1 es el nivel de ruido en la fuente (95 dBA), L2 es el nivel de ruido a la distancia deseada (90 dBA), r1 es la distancia de referencia desde la fuente (1 metro) y r2 es la distancia buscada, con lo que se consigue que son necesarios mínimo 1,78 metros de distancia segura por un periodo de 8 horas.

<sup> 2</sup>Para resguardos fijos, 6 mm (0.25 pulgadas) de las partes peligrosas, altura 1.5-2.0 metros (59-78 pulgadas) del suelo. Botones de seguridad a menos de 0.6 metros (2 pies) del punto de operación, altura 0.9-1.2 metros (35-47 pulgadas) del suelo. Botones de parada de emergencia máximo 1.7 metros (5.6 pies) desde cualquier punto del área de trabajo, altura 0.9-1.4 metros (35-55 pulgadas) del suelo. Barreras de luz a distancia determinada por velocidad de aproximación y tiempo de respuesta, altura 0.9-1.5 metros (35-59 pulgadas) del suelo

















## Referencias

1. Corona. 2010. Manual para la manipulación de productos: Decorados & Complementos. [Manual](https://www.megamafers.com/wp-content/uploads/2015/06/Lacasitos.pdf)
