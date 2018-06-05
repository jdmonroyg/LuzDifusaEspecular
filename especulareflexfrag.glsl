#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
uniform int lightCount;

varying vec4 vertexColor;
varying vec3 ecNormal;
varying vec3 luzDireccion[8];

varying vec3 direccionCamara;
varying vec3 reflejoDireccionLuz;
varying vec3 reflejoDireccionLuzArreglo[8];

void main() {
  vec3 camera = normalize(direccionCamara);
  float intensitySpecular[8];
  vec4 specularSum = vec4(0,0,0,0);
  vec3 normal = normalize(ecNormal);
  
  for(int i =0; i < lightCount; i++){
    //intensidad de color por numero de luces 
    vec3 direction = normalize(reflejoDireccionLuzArreglo[i]);
   
    intensitySpecular[i] = pow(max(0.0, dot(direction, camera)) , 3);
    
  }
  vec4 colors[8];  
  colors[0] = vec4(intensitySpecular[0], 0 ,0 , 1);
  colors[1] = vec4(0, intensitySpecular[1] , 0, 1);
  colors[2] = vec4(0, 0 , intensitySpecular[2], 1);
  colors[3] = vec4(intensitySpecular[3], intensitySpecular[3] , 0, 1);
  colors[4] = vec4(intensitySpecular[4], 0 , intensitySpecular[4], 1);
  colors[5] = vec4(0, intensitySpecular[5] , intensitySpecular[5], 1);
  colors[6] = vec4(0, 0 , 0, 1);
  colors[7] = vec4(intensitySpecular[7]/3, intensitySpecular[7]/3 , intensitySpecular[7]/3, 1);

   for(int i =0; i < lightCount; i++){
     specularSum += colors[i];
   }

  gl_FragColor = (specularSum) * vertexColor;
}