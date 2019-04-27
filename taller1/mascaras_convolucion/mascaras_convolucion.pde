PGraphics py;
PGraphics pg;
PImage img, img2;

void setup() {
  size(900, 1006);
  colorMode(HSB);

  img = loadImage("img.jpg");
  img2 = loadImage("img.jpg");
}

void draw() {
  image(img, 0, 0);
  image(img2, 0, img.height);

  img2.loadPixels();


  img2.updatePixels();
}
