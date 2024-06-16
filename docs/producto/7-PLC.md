# Programación de PLCs

Para el control de la planta se desarrollo las rutinas de control mediante studio 5000.

## Dobladora de Cajas

Una de las etapas a automatizar es el empaquetado donde se remplaza el trabajo manual por una dobladora de cajas. Para controlar su movimiento se inicia por identificar las señales que se conectarían al PLC.


### Lista de Entradas y Salidas 

|      Nombre            |      Tipo      |      Descripción                     |
|------------------------|----------------|--------------------------------------|
|      actuador_derecho  |      Salida    |      Actuador en el lado derecho     |
|      actuador_frontal  |      Salida    |      Actuador en el frente           |
|      actuador_izquierdo|      Salida    |      Actuador en el lado izquierdo   |
|      actuador_superior |      Salida    |      Actuador en la parte superior   |
|      actuador_trasero  |      Salida    |      Actuador en la parte trasera    |
|      banda_1           |      Salida    |      Banda transportadora 1          |
|      banda_2           |      Salida    |      Banda transportadora 2          |
|      giro_piston_2     |      Salida    |      Giro del pistón 2               |
|      proximidad_1      |      Entrada   |      Sensor de proximidad 1          |
|      proximidad_2      |      Entrada   |      Sensor de proximidad 2          |
|      proximidad_3      |      Entrada   |      Sensor de proximidad 3          |
|      start             |      Entrada   |      Botón de inicio                 |
|      stop              |      Entrada   |      Botón de parada                 |
|      testigo           |      Salida    |      Indicador luminoso              |

### Etapas y lógica de control

La empacadora se controla mediante un PLC el cual maneja una rutina main en desarrollada en lenguaje ladder que se encarga de controlar el comportamiento general, encargada del arranque y parada, selección de modo de operación entre producción y manual; así como el llamado a subrutinas de control que desarrollan la secuencia específica del movimiento. Dentro del modo manual se tiene control individual para cada una de las señales y se utiliza para la verificación de funcionamiento y ajuste de la máquina. Por otro lado el modo de producción tiene la rutina completa de movimiento efectuado por la máquina. La lógica de control de movimiento fue desarrollado en lenguaje GRAFCET.

```
flowchart LR
  Start --> Stop

```


