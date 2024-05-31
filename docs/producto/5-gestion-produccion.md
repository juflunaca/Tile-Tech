# Gestion de producción 

El análisis de la gestión de producción se realiza utilizando la información recopilada anterior sobre la capacidad productiva del cada proceso. Resumen del cual puede observarse en la siguiente tabla. 

![production table](5production-table.png)

## VSM (Value Stream Mapping)

Igualmente se realizó un mapa de flujo de valor para identificar los procesos con mayor potencial de mejora y candidatos a ser automatizados. 

![VSM](5vsm-actual.png)


## Calidad 

Basado en el siguiente reporte y tomando un parámetro de calidad estimado de 90% se obtiene la calidad correspondiente a cada uno de cada uno de los procesos según su respectiva prevalencia en los defectos encontrados por el reporte:

> Entre las 588 muestras obtenidas, los defectos incluyen tipos de grietas (60,9%), esquinas rotas (9,9%), defectos de impresión y decoración (9,4%), bordes rotos (8%), defectos en el esmaltado inferior (5,4%), sombras ( 3,9%) y otros casos (2,6%). Teniendo en cuenta las cuestiones anteriores, se analizó el parámetro de tipos de grietas como la principal causa de creación de defectos en las baldosas, que se asoció con las máquinas de prensado
> Tomado de [1]


* grietas -> prensado : Q = 93.90 %
* esquinas rotas, bordes rotos -> empaquetado: Q = 98.1%
* defectos de impresión y decoración -> decoración : Q = 99.06%
* defectos en el esmaltado inferior, sombras -> esmaltado: Q =99.07%
* otros casos ->  molienda: Q = 99.85% atomizado: Q = 99.85%, secado: Q = 99.85%, cocción: Q = 99.85% 

$Q_A = 0.9390 * 0.981 * 0.9906 * 0.9907 * 0.9985^4 = 0.8986$

## Availability

Para el de cálculo de la disponibilidad se toma en cuenta la información de la tabla de producción y se asume que la disponibilidad de cada proceso es la misma.

Una vez establecidos estos parámetros se realiza la simulación del proceso utilizando la herramienta *Tecnomatix* y se observa la interacción de los procesos en conjunto.

## Simulación de la planta previo a la intervención

![teconmatix](5plant-simulation.png)



## Cuellos de botella y áreas de mejora 


## Simulación de la planta posterior a la intervención 


<iframe width="560" height="315" src="https://www.youtube.com/embed/g787zu8fRos?si=ISe74xTQL-Or5DCZ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


## Indicadores claves de diseño



<embed src="/Tile-Tech/KPI.pdf" type="application/pdf" width="100%" height="600px" />

[KPI](/KPI.pdf)

## Reporte de tecnomatix previo a intervención
<iframe src="/Tile-Tech/report_tecnomatix_previous.pdf" type="application/pdf" width="100%" height="600px" ></iframe>


## Reporte de tecnomatix posterior a intervención
<iframe src="/Tile-Tech/report_tecnomatix_after.pdf" type="application/pdf" width="100%" height="600px" ></iframe>


<iframe src="/Tile-Tech/tecnomatix_report.html"  width="90%" height="400" frameborder="0" allowfullscreen></iframe>

<!---
## Modelos usado en el diseño
- caja de empaque tomado de [Cardboard Insert](https://grabcad.com/library/cardboard-insert-1)
-->

## Referencias
1. 