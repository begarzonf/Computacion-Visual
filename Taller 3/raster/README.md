# Taller raster

## Propósito

Comprender algunos aspectos fundamentales del paradigma de rasterización.

## Tareas

Emplee coordenadas baricéntricas para:

1. Rasterizar un triángulo.
2. Sombrear su superficie a partir de los colores de sus vértices.
3. (opcional para grupos menores de dos) Implementar un [algoritmo de anti-aliasing](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) para sus aristas.

Referencias:

* [The barycentric conspiracy](https://fgiesen.wordpress.com/2013/02/06/the-barycentric-conspirac/)
* [Rasterization stage](https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-stage)

Implemente la función ```triangleRaster()``` del sketch adjunto para tal efecto, requiere la librería [nub](https://github.com/nakednous/nub/releases).

## Integrantes

|      Integrante      |github nick|
|----------------------|-----------|
| Alejandro Santamaría | alejosaur |
| Brayan Esteban Garzón| begarzonf |
|  Juan Camilo Lozano  |  olimita  |

## Discusión

Al realizar la ranterizacion con cordenadas baricentricas y un anti-aliasing adecuado se logra pintar un tirangulo casi perfecto obteniendo resultados bastante favorables. Para el anti-aliasing se utiliza la tecnica de la siguiente pagina [anti-aliasing](https://web.archive.org/web/20180802080710/https://www.scratchapixel.com/lessons/3d-basic-rendering/rasterization-practical-implementation/rasterization-practical-implementation) con unos ligeros cambios donde utilizamos 5 puntos, las cuatro esquinas del cuadrado y el centro, de resto se aplica de igual forma lo nombrado en esta.

## Entrega

* Plazo: ~~2/6/19~~ 4/6/19 a las 24h.
