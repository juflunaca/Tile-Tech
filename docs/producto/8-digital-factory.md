# Digital Factory

Se presenta el desarrollo de la simulación de una fábrica digital desarrollado en NX.

## Gemelo digital

Se realizo el gemelo digital de una maquina de empacado de baldosas, en el cual se simula el proceso y se maneja la actuación a traves de comunicación OPC a traves de ignition conectando NX con el un controlador PLC simulado. La logica es desarrollada usando lenguaje ladder para determinar la de las subrutinas a desarrollar. Las cuales fueron desarrolladas en GRAFCET, el cual facilita el desarrollo de rutina complejas mediante la representación gráfica de las mismas.

![ gemelo digital](./digital-factory/basic-physics.png)

![ gemelo digital](./digital-factory/sensors-actuators.png){width=60%}


![ gemelo digital](./digital-factory/OPC-signals.png){width=60%}


<iframe width="560" height="315" src="https://www.youtube.com/embed/OOryg0T-8Ps?si=zwQEkovh5ce04zeW" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


A continuación se presenta la demostración del funcionamiento de las etapas del proceso desarrollo en NX.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Azf9Fd5UB84?si=1J0MO_XdI1FadSqF" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Cada estación de trabajo fue desarrollada en NX, en un archivo independiente, a fin de tener modularidad e independencia entre las mismas. Gracias a lo anterior el control y la puesta en marcha puede desarrollarse por etapas, sin tener que enfrentar la complejidad y el peso computacional de todas las escenas en simultáneo. Se realiza la integración de las rutinas de cada estación en el archivo `ceramic_plant.prt` obteniendo la planta completa como se observa en la imagen.

![gemelo digital](./digital-factory/layout-fabrica.png){width=60%}


<!--

![sensor de proximidad](./digital-factory/sensor-proximidad.png){width=60%}
-->