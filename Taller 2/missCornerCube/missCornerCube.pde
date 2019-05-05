PGraphics py;
PGraphics pg;
int SIZE = 150;
float angleY = -(PI/4);
float angleXZ = 0;

void setup() {
  size(1920, 1020, P3D);

}

void draw() {  
  background(30);
  ambientLight(255, 255, 255);
  directionalLight(255, 255, 255, 0.5, 0, -1);
  fill(121,121,252);
  noStroke();
  translate(width/2-SIZE, height/2, 0); 
  rotateY(angleY);
  rotateX(angleXZ);
  rotateZ(angleXZ);
  box(SIZE);
  translate(0, SIZE, 0); 
  box(SIZE);
  translate(SIZE, -SIZE, 0); 
  box(SIZE);
  translate(0, SIZE, -SIZE); 
  box(SIZE);
  translate(-SIZE, 0, 0); 
  box(SIZE);
  translate(0, -SIZE, 0); 
  box(SIZE);
  translate(SIZE, 0, 0); 
  box(SIZE);
}

void mouseMoved() {
  angleY = ((mouseX/(width + 0.0))*2.0*PI);
  angleXZ = ((mouseY/(height + 0.0))*2.0*PI);
}
