# Proyecto Luces
## Integrantes


| Integrante | github nick |
|------------|-------------|
|      Jesus David Monroy Garces      |     jdmonroyg      |

## Objetivos

En este proyecto se desea estudiar dos tipos de iluminacion que son difusa y especular utilizando processing y glsl, se 
agregan hasta 8 direcciones de luz a un objeto obj y se hace la respectiva comparacion entre estos tipos de luz.

## Descripcion 
Se utiliza un libreria llamada "peasycam" en processing para el manejo de la camara en el sketch, se hace una funcion
para calulcar los puntos de luces (1 a 8) con respecto a un radio de luz y el angulo. Luego en el draw cargamos los shader en glsl para las iluminaciones. Para la luz especular hacemos el calculo correspondiente utilizando la funcion reflect que calcula la dirección de reflexión entre un vector de incidente(normalizado y negativo) y el vector normal; luego calculamos la instensidad para el efecto especular haciendo una potencia de 3 para el maximo entre 0 y el producto entre el calculo de la funcion reflect para cada direccion de la luz y la direccion de la camara ambas normalizadas. Para la iluminacion difusa es el mismo procedimiento sin utilizar el la funcion reflect y calculando intensidad difusa calculando el maximo entre 0 y el producto entre el vector normal y la direccion de la camara, estando normalizados. 


## Resultados
A continuacion se muestra los resultados obtenidos tanto para la iluminacion difusa y especular.

En esta imagen podemos obsevar reflexion difusa realizada a un obj importado en nuestro sketch: ![alt](https://github.com/jdmonroyg/LuzDifusaEspecular/blob/master/Difusa.png)

En esta otra imagen observamos la reflexion especular: ![alt](https://github.com/jdmonroyg/LuzDifusaEspecular/blob/master/Especular.png)



## Referencias
* [Práctica 3. El Modelo de Iluminación Local (MIL) de OpenGL ](https://lsi.ugr.es/curena/doce/vr/pracs.ext/03/)
* [OpenGL ES Software Development Kit](https://www.khronos.org/registry/OpenGL-Refpages/es3.1/)
* [GLSL Programming/GLUT/Specular Highlights](https://en.wikibooks.org/wiki/GLSL_Programming/GLUT/Specular_Highlights)
*[GLSL Programming/GLUT/Diffuse Reflection](https://en.wikibooks.org/wiki/GLSL_Programming/GLUT/Diffuse_Reflection)
