# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises.
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Complete la tabla:

|      Integrante      |github nick|
|----------------------|-----------|
| Alejandro Santamaría | alejosaur |
| Brayan Esteban Garzón| begarzonf |
|  Juan Camilo Lozano  |  olimita  |

## Discusión

Se realizaron en total 4 actividades:

* Filtro blanco y negro en imagen.
* Filtro blanco y negro en video con display de fps.
* Mascaras de convolución en imagen.
* Segmentación de una imagen segun el histograma.

Los procedimientos que seguimos fueron bastante simples pero efectivos para el estudio de los efectos de filtro y mascaras de convolución. Se hace una conversion pixel a pixel realizando calculos basicos, y se encuentra que los filtros pueden servir para resaltar ciertas partes de la imagen, cuentan una historia.

## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesión de taller.
