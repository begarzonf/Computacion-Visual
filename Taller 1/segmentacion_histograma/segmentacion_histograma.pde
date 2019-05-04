PGraphics py;
PGraphics pg;
PImage img, img2;
float div;

void setup() {
  size(1790, 683);
  colorMode(HSB);

  img = loadImage("img.jpg");
  img2 = loadImage("img.jpg");
  div = 255.0/img.width;
}

void draw() {
  image(img, 0, 0);
  image(img2, img.width, 0);
  int[] hist = new int[256];

  img2.loadPixels();

  // Histograma
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++;
    }
  }

  // Find the largest value in the histogram
  int histMax = max(hist);
  
  stroke(255);
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < img.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, img.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(i, img.height, i, y);
  }

  img2.updatePixels();
}

void mouseMoved() {
  
  for (int i = 0; i < img.pixels.length; i++) {

    if (!(brightness(img.pixels[i]) <= mouseX*div+8 && brightness(img.pixels[i]) >= mouseX*div-8)) {
      img2.pixels[i] = color(0);
    }else{
      img2.pixels[i] = img.pixels[i];
    }

  }
  print(mouseX*div+8);
  print("\n");
}
