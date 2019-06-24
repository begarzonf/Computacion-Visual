PGraphics py;
PGraphics pg;
PImage img, img2;
float[][] blur = { { 0.0625, 0.125, 0.0625 },
                   { 0.125, 0.25, 0.125 },
                   { 0.0625, 0.125, 0.0625 } };
float[][] emboss = { { -2, -1,  0 },
                     { -1,  1,  1 },
                     {  0,  1,  2 } };
float[][] sharpen = { {  0,  -1,  0 },
                      {  -1, 5,  -1 },
                      {  0,  -1,  0 } };
float[][] edgeDetect = { { -1, -1, -1 },
                      { -1,  8, -1 },
                      { -1, -1, -1 } };
                    
void setup() {
  size(1000, 541, P3D);
  colorMode(HSB);
  img = loadImage("templo.jpg");
  img2 = loadImage("templo.jpg");
}

void draw() {
  image(img, 0, 0);
  int matrixsize = 3;
  img2.loadPixels();
  for (int x = 0; x < img2.width; x++) {
    for (int y = 0; y < img2.height; y++ ) {
      color c = convolution(x, y, blur, matrixsize, img2);
      int loc = x + y*img2.width;
      img.pixels[loc] = c;
    }
  }

  img.updatePixels();
}
color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      loc = constrain(loc,0,img.pixels.length-1);
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  return color(rtotal, gtotal, btotal);
}
