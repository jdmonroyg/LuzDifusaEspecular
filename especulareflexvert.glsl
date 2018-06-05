//constantes en la escena / vetices
uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec3 lightNormal;
uniform int lightCount;
uniform vec4 lightPosition[8];

//especificos de cada vertices
attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

//envio del vertex a frag
varying vec4 vertexColor;
varying vec3 ecNormal;
varying vec3 luzDireccion[8];
varying int luzContador;

varying vec3 direccionCamara;
varying vec3 reflejoDireccionLuz;
varying vec3 reflejoDireccionLuzArreglo[8];

void main() {
  gl_Position = transform * position;
  vec3 ecPosition = vec3(modelview * position);

  ecNormal = normalize(normalMatrix * normal);
    for (int i = 0; i < lightCount; i++){
        luzDireccion[i] = normalize(lightPosition[i].xyz - ecPosition);
        reflejoDireccionLuzArreglo[i] = reflect(-luzDireccion[i], ecNormal); 
    }

  vertexColor = color;
  luzContador = lightCount;

  vec3 lightDirection = normalize(lightPosition[0].xyz - ecPosition);
  direccionCamara = normalize(0 - ecPosition);
  reflejoDireccionLuz = reflect(-lightDirection, ecNormal);

}