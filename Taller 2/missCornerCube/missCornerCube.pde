PGraphics py;
PGraphics pg;
int SIZE = 100;

void setup() {
  size(1024, 768, P3D);

}
void draw() {
  directionalLight(255, 255, 255, 1, 1, 0);
  fill(121,121,252);
  noStroke();
  translate(width/2-SIZE, height/2-2*SIZE, 0); 
  rotateY(-0.785398);
  //rotateX(0.5);
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
