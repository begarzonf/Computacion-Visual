PGraphics py;
PGraphics pg;
PImage img;
int offset = 0;

void setup() {
  size(853, 343);
  colorMode(HSB);

  img = loadImage("base.jpg");
}
void draw() {
  fill(0);
  int base=300+offset;
  noStroke();
  image(img, 0, 0);
  for (int i=0; i < 50; i++){
    rect(base,0,13,width);
    base = base + 15;
  }
}

void keyPressed() {
  if (key == 'd') {
    offset += 2;
  } else if(key == 'a') {
    offset -= 2;
  }
}  
