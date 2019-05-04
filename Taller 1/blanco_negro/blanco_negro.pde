PGraphics py;
PGraphics pg;
PImage img, img2, img3, img4;

void setup() {
  size(1344, 1008);
  colorMode(HSB);

  img = loadImage("img.jpg");
  img2 = loadImage("img.jpg");
  img3 = loadImage("img.jpg");
  img4 = loadImage("img.jpg");
}
void draw() {
  image(img, 0, 0);
  image(img2, img.width, 0);
  image(img3, 0, img.height);
  image(img4, img.width, img.height);
  int[] hist = new int[256];

  img2.loadPixels();
  img3.loadPixels();
  img4.loadPixels();

  int tresshold = 128;

  for (int i = 0; i < img2.pixels.length; i++) {

    //Blanco y negro con tresshold
    if (brightness(img2.pixels[i]) < tresshold) {
      img2.pixels[i] = color(0);
    } else {
      img2.pixels[i] = color(255);
    }


    //Escala de grises por brillo
    img3.pixels[i] = color(brightness(img.pixels[i]));

    //Escala de grises por promedio
    float avg = (red(img.pixels[i]) + green(img.pixels[i]) + blue(img.pixels[i]))/3;
    img4.pixels[i] = color(avg);
  }

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
  img3.updatePixels();
  img4.updatePixels();
}
