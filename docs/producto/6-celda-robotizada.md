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

Se selecciona la alternativa 3 como la mejor opción, según los siguientes criterios:

- Es la alternativa que menos espacio utiliza
- Permite un fácil acceso al controlador
- Permite una correcta visualización del proceso desde la perspectiva del operario
- Mejor aprovechamiento del área de trabajo y alcance del robot

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
| ANSI/RIA R15.06-2012 | Safety Requirements for Industrial Robots | Establece requisitos de seguridad para robots industriales, incluyendo la determinación de la distancia segura para la ubicación de dispositivos de protección. Esta distancia depende del alcance y la velocidad del robot, así como del tiempo de respuesta del sistema de protección<sup>3</sup>. |
| RIA TR R15.306 (“TR 306”) | Evaluación de Riesgos Basada en Tareas: Identificar y descomponer todas las tareas que se realizarán en la celda robótica, incluyendo la configuración, operación, mantenimiento, y situaciones de emergencia. Registrar detalladamente cada tarea, especificando las acciones necesarias, las herramientas utilizadas y las interacciones con el robot. Para cada tarea identificada, determinar los posibles peligros asociados, como puntos de atrapamiento, movimientos inesperados del robot, contacto con superficies calientes o afiladas, etc.Evaluar el riesgo asociado a cada peligro identificado, considerando la probabilidad de ocurrencia y la gravedad de las posibles consecuencias. Usar matrices de riesgos para clasificar y priorizar los riesgos. Las matrices suelen cruzar la probabilidad con la gravedad para obtener una puntuación de riesgo. Determinar medidas de mitigación, verificar y validar. | - Resguardos físicos con sensores de proximidad. <br> - Barreras físicas para contener las cargas y dispositivos de sujeción. <br> - Protectores auditivos y barreras acústicas. <br> - Procedimientos de trabajo seguro y dispositivos de bloqueo y etiquetado. <br> - Controles de acceso, como puertas con cerraduras y sistemas de control de acceso. |
| RIA TR R15.406 (“TR 406”) | Diseño de salvaguardas | Implementar medidas de protección específicas como barreras físicas, sensores de presencia y dispositivos de enclavamiento. |
| RIA TR R15.506 ("TR 506") | Aborda la aplicabilidad de los requisitos establecidos en la norma ANSI/RIA R15.06-2012 para robots industriales existentes. Esta guía proporciona orientación sobre cómo aplicar los estándares de seguridad establecidos por la R15.06-2012 a los robots que ya están en funcionamiento en entornos industriales. | Básicamente resguardos y barreras físicas, detección de presencia, parada de emergencia, sistema de control de acceso para limitar quién puede operar o programar el robot y mantenerse una documentación completa de los procedimientos de seguridad, mantenimiento y operación del robot para referencia futura y fines de cumplimiento normativo. Adicionalmente, se requiere establecer un programa de mantenimiento preventivo y se deben realizar inspecciones regulares. | 
| RIA TR R15.606 ("TR 606") | Se centra en proporcionar requisitos específicos y pautas de seguridad para robots colaborativos. Se basa en la norma ISO 10218-1 y 2, que establece requisitos de seguridad generales para robots industriales, pero se enfoca específicamente en aspectos relacionados con la seguridad de los cobots. | No aplica. |
| ISO 10218-1,2:2011 | Especifica los requisitos y las directrices para el diseño seguro, las medidas de protección y la información para el uso de robots industriales. | Implementar sistemas de monitoreo continuo, y garantizar el fácil acceso a dispositivos de parada de emergencia. Utilizar protecciones físicas y electrónicas que se activen en caso de una situación peligrosa. Proveer manuales detallados y capacitación a los usuarios sobre los procedimientos seguros de operación y mantenimiento. |

<sup> 1</sup> Asumiendo una fuente de 95dBA a una distancia de referencia de 1 metro, podemos calcular la distancia segura con la fórmula de atenuación del ruido: L2 = L1 - 20Log10(r2/r1), donde L1 es el nivel de ruido en la fuente (95 dBA), L2 es el nivel de ruido a la distancia deseada (90 dBA), r1 es la distancia de referencia desde la fuente (1 metro) y r2 es la distancia buscada, con lo que se consigue que son necesarios mínimo 1,78 metros de distancia segura por un periodo de 8 horas.

<sup> 2</sup> Para resguardos fijos, 6 mm (0.25 pulgadas) de las partes peligrosas, altura 1.5-2.0 metros (59-78 pulgadas) del suelo. Botones de seguridad a menos de 0.6 metros (2 pies) del punto de operación, altura 0.9-1.2 metros (35-47 pulgadas) del suelo. Botones de parada de emergencia máximo 1.7 metros (5.6 pies) desde cualquier punto del área de trabajo, altura 0.9-1.4 metros (35-55 pulgadas) del suelo. Barreras de luz a distancia determinada por velocidad de aproximación y tiempo de respuesta, altura 0.9-1.5 metros (35-59 pulgadas) del suelo

<sup> 3</sup> Se usa la fórmula Ds=Va×(Ts+Tr)+C, donde Ds es la distancia segura. Va es la velocidad de aproximación. Ts es el tiempo de respuesta del sistema de protección. Tr es el tiempo de respuesta del robot. C es el margen de seguridad adicional. Suponiendo Tiempo de respuesta del sistema de protección (Ts): 0.05 segundos, Tiempo de respuesta del robot (Tr): 0.1 segundos, Velocidad de aproximación (Va): 1.6 m/s y Margen de seguridad (C): 0.12 m, tenemos que la distancia segura a la que se deben ubicar los dispositivos de protección es de 0.36 metros (36 cm).

### Análisis de Riesgos y Medidas de Seguridad

Nos basamos en la RIA TR R15.306 (“TR 306”) para la evaluación de riesgos:
1. Identificación de Tareas
- Configuración del Sistema: Incluye la programación y ajustes del robot para la tarea de paletizado.
- Carga y Descarga de Baldosas: Operaciones de manejo de cargas que involucran el transporte y apilado de las baldosas cerámicas.
- Mantenimiento del Robot: Tareas de mantenimiento preventivo y correctivo del robot y sus dispositivos periféricos.
- Manejo de Emergencias: Procedimientos para responder a situaciones de emergencia, como detención de emergencia del robot.
2. Identificación de Peligros
- Atrapamiento y Aplastamiento: Riesgo de que los trabajadores queden atrapados entre el robot y las máquinas periféricas o las baldosas cerámicas durante la operación de paletizado.
- Caída de Objetos: Posibilidad de que las baldosas cerámicas se caigan o desplacen durante el proceso de paletizado, causando lesiones por impacto.
- Exposición al Ruido: Riesgo de exposición a niveles elevados de ruido generado por el funcionamiento del robot y las máquinas periféricas.
- Interferencia con Operaciones Manuales: Peligro de colisión o lesiones al interactuar con el robot durante la carga, descarga o mantenimiento.
- Acceso No Autorizado: Posibilidad de acceso no autorizado a la zona de trabajo del robot mientras está en funcionamiento.

Esto puede ser representado por la siguiente tabla:

| Peligro | Gravedad | Probabilidad |
| ------- | -------- | ------------ |
| Atrapamiento y Aplastamiento | Alta | Moderada |
| Caída de Objetos | Moderada | Moderada |
| Exposición al Ruido | Moderada | Alta |
| Interferencia con Operaciones Manuales | Moderada | Baja |
| Acceso No Autorizado| Baja | Moderada |

3. Evaluación de Riesgos
   
Para evaluar los riesgos asociados con cada peligro identificado, se consideran la probabilidad y la gravedad de las posibles consecuencias.

- Atrapamiento y Aplastamiento: Alta gravedad, ya que puede causar lesiones graves o incluso la muerte. Probabilidad moderada durante la operación normal del robot.
- Caída de Objetos: Gravedad moderada, ya que puede causar lesiones graves o daños materiales. Probabilidad moderada durante la manipulación de cargas.
- Exposición al Ruido: Gravedad moderada, con exposición prolongada que puede causar daños auditivos. Probabilidad alta debido al funcionamiento continuo del robot.
 - Interferencia con Operaciones Manuales: Gravedad moderada, con el riesgo de lesiones por colisión o aplastamiento. Probabilidad baja si se siguen los procedimientos de seguridad adecuados.
 - Acceso No Autorizado: Gravedad baja, pero probabilidad moderada si no se implementan controles de acceso adecuados.
   
4. Determinación de Medidas de Mitigación

Basándonos en los riesgos evaluados, se determinan las siguientes medidas de mitigación:

- Atrapamiento y Aplastamiento: Instalación de resguardos físicos alrededor del área de trabajo del robot y las máquinas periféricas, con sensores de proximidad para detener el robot en caso de detección de presencia humana.
- Caída de Objetos: Implementación de barreras físicas para contener las baldosas cerámicas en la zona de paletizado y dispositivos de sujeción para asegurar las cargas en tránsito.
- Exposición al Ruido: Uso de protectores auditivos para los trabajadores expuestos a niveles elevados de ruido. Además, se deben colocar barreras acústicas alrededor del área de trabajo para reducir la propagación del ruido.
- Interferencia con Operaciones Manuales: Establecimiento de procedimientos de trabajo seguro que limiten la interacción directa entre los trabajadores y el robot durante la operación normal. Se deben proporcionar dispositivos de bloqueo y etiquetado para asegurar el equipo durante el mantenimiento.
- Acceso No Autorizado: Implementación de controles de acceso, como puertas con cerraduras y sistemas de control de acceso, para prevenir el ingreso no autorizado a la zona de trabajo del robot.

Por lo tanto, se concluye que las medidas de seguridad y mitigación adecuadas son: 

- Resguardos físicos con sensores de proximidad.
- Barreras físicas para contener las cargas y dispositivos de sujeción.
- Protectores auditivos y barreras acústicas.
- Procedimientos de trabajo seguro y dispositivos de bloqueo y etiquetado.
- Controles de acceso, como puertas con cerraduras y sistemas de control de acceso.

## Simulación de la celda robótica

Para simular la rutina de la celda robótica se utilizó el software RoboDK. A continuación se muestra el layout desarrollado en RoboDK

![celda](https://github.com/juflunaca/Tile-Tech/assets/55969494/3d3eafb4-008e-43ff-976c-9ed0da5c364a)

## Referencias

1. Corona. 2010. Manual para la manipulación de productos: Decorados & Complementos. [Manual](https://www.megamafers.com/wp-content/uploads/2015/06/Lacasitos.pdf)
