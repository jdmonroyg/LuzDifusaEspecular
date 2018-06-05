# Proyecto Luces
## Integrantes


| Integrante | github nick |
|------------|-------------|
|      Jesus David Monroy Garces      |     jdmonroyg      |

## Objetivos

En este proyecto se desea estudiar dos tipos de iluminacion que son difusa y especular utilizando shader en processing y glsl,  agregando hasta 8 direcciones de luz a un objeto obj y se hace la respectiva comparacion entre estos tipos de luz.

## Descripcion 
Se utiliza un libreria llamada "peasycam" en processing para el manejo de la camara en el sketch de processing, adicionalmente se hace un vert.glsl y un frag.glsl para los dos tipos de iluminacion, en processing se hace una funcion
para calulcar los puntos de luces (1 a 8) con respecto a un radio de luz y el angulo. Luego en el draw cargamos los shader en glsl para las dos iluminaciones. Para la luz especular hacemos el calculo correspondiente utilizando la funcion reflect que calcula la dirección de reflexión entre un vector de incidente(normalizado y negativo) y el vector normal; luego calculamos la instensidad para el efecto especular haciendo una potencia de 3 para el maximo entre 0 y el producto entre el calculo de la funcion reflect para cada direccion de la luz y la direccion de la camara ambas normalizadas. Para la iluminacion difusa es el mismo procedimiento sin utilizar el la funcion reflect y calculando intensidad difusa calculando el maximo entre 0 y el producto entre el vector normal y la direccion de la camara, estando normalizados. 


## Resultados y  trabajo futuro
A continuacion se muestra los resultados obtenidos tanto para la iluminacion difusa y especular.

En esta imagen podemos obsevar reflexion difusa realizada a un obj importado en nuestro sketch: ![alt](https://github.com/jdmonroyg/LuzDifusaEspecular/blob/master/Difusa.png)

En esta otra imagen observamos la reflexion especular: ![alt](https://github.com/jdmonroyg/LuzDifusaEspecular/blob/master/Especular.png)

Se espera mejorar las implementaciones a medida que se conozca de mejor forma el lengua glsl y agregar un nuevo tipo de luz ambiental para generar una mezcla en estos tres tipos de iluminaciones que se ven en la cotidianidad. 


## Referencias
* [Práctica 3. El Modelo de Iluminación Local (MIL) de OpenGL ](https://lsi.ugr.es/curena/doce/vr/pracs.ext/03/)
* [OpenGL ES Software Development Kit](https://www.khronos.org/registry/OpenGL-Refpages/es3.1/)
* [GLSL Programming/GLUT/Specular Highlights](https://en.wikibooks.org/wiki/GLSL_Programming/GLUT/Specular_Highlights)
* [GLSL Programming/GLUT/Diffuse Reflection](https://en.wikibooks.org/wiki/GLSL_Programming/GLUT/Diffuse_Reflection)
