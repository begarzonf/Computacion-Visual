# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Implementar un modelo de iluminación que combine luz ambiental con varias fuentes puntuales de luz especular y difusa. Tener presente _factores de atenuación_ para las fuentes de iluminación puntuales.
3. (grupos de dos o más) Implementar el [bump mapping](https://en.wikipedia.org/wiki/Bump_mapping).

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|   Brayan Esteban Garzon         |   begarzonf          |
|   Alejandro Santamaria Perez         |   alejosaur          |
|   Juan camilo Lozano Mejia         |   olimita         |



## Informe

Se realizo la implementación de unos archivos GLSL para pasarlos en processing por medio de la funcion shader, se observan resultados notables en el apartado de imagenes, de una calidad similar a la lograda con mascaras de convolucion, aunque la comparación resulta complicada por un bug en la implementacion de mascaras de convolución resulta en imagenes de tonos morados. En el caso de video los resultados son muy sobresalientes con shaders y a la hora de realizar un recuento de los frames la imagen de video se va completamente por lo tanto esta parte esta comentada en el codigo, aunque se espera un mejor rendimiento al hacer la operación por hardware y no por software.


Para el Bump Mapping se utilizo la siguiente imagen:
<p align="center">
  <b>Imagen original</b><br>
  <br><br>
  <img src="https://github.com/begarzonf/Computacion-Visual/blob/master/Taller%204/BumpMapping/imagen.png">
</p>


Se realizo mapeo de vectores normales y se uso fuentes de iluminacion, con ayuda del mapa de vectores normales y la generacion de un bumpMap se pudo generar un buen efecto en la superficie con los siguientes resultado:

<p align="center">
  <b>Resultado final en processing</b><br>
  <br><br>
  <img src="https://github.com/begarzonf/Computacion-Visual/blob/master/Taller%204/BumpMapping/imagen2.png">
</p>


<p align="center">
  <b>Resultado final en processing 2</b><br>
  <br><br>
  <img src="https://github.com/begarzonf/Computacion-Visual/blob/master/Taller%204/BumpMapping/imagen3.png">
</p>

