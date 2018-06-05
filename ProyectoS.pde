import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PShape pokemon;

float angulo;
float rotacion;
PShader activarshader;
PShader especular;
PShader difusa;
float luzn=0;
float luzradio=250;
void setup() {
  size(800, 600, P3D);
  PeasyCam camara = new PeasyCam(this, 300);
  camara.setMinimumDistance(60);
  camara.setMaximumDistance(600);
 
  pokemon= loadShape("Pokemon.obj");
  especular = loadShader("especulareflexfrag.glsl", "especulareflexvert.glsl");
  difusa = loadShader("difusareflexfrag.glsl", "difusareflexvert.glsl");
  angulo = TWO_PI /50;
  activarshader=especular;
}

void draw() {
  background(255);
  //translate(width/2, height/2);
  
  if (luzn>=1){
    //luzradio =mouseX*2+100;
    luces();
    shader(activarshader);
  }
  else
    resetShader();
  
  rotateY(rotacion);
  rotateX(radians(90));
  
  shape(pokemon);
  //shader(colorShader);
  rotacion += 0.01;
  
}

void luces(){
  angulo = 2*PI/luzn;
  for(int i=0 ; i < luzn; i++ ){
    float x=luzradio*cos(i*angulo + 3*PI/2);
    float z=luzradio*sin(i*angulo + 3*PI/2);
    pointLight(0, 0 , 0, luzradio*cos(i*angulo + 3*PI/2), 0, luzradio*sin(i*angulo + 3*PI/2)); 
    pushMatrix();
    //resetShader();
    translate(x,0,z);
    sphere(20);
    popMatrix();
  }
}

void keyPressed() {
  if (key == ' ')
    luzn = luzn < 8 ? luzn+1 : 0;
  if (key =='e')
    activarshader=especular;
  if(key == 'd')
    activarshader=difusa;
  
    
}
