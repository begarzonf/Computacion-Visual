PGraphics py;
PGraphics pg;
PImage img, img2;
float[][] matrix = { { 1, -2, 1 },
                     { 2, -4, 2 },
                     { 1, -2, 1 } };
float[][] matrix2 = { { -2, -1,  0 },
                      { -1,  1,  1 },
                      {  0,  1,  2 } };
float[][] matrix3 = { {  0,  1,  0 },
                      {  1, -4,  1 },
                      {  0,  1,  0 } };
float[][] matrix4 = { { -1, -1, -1 },
                      { -1,  8, -1 },
                      { -1, -1, -1 } };
                    
void setup() {
  size(900, 1006);
  colorMode(HSB);
  img = loadImage("img.jpg");
  img2 = loadImage("img.jpg");
}

void draw() {
  image(img, 0, 0);
  image(img2, 0, img.height);
  int matrixsize = 3;
  img2.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      color c = convolution(x, y, matrix3, matrixsize, img);
      int loc = x + y*img.width;
      img2.pixels[loc] = c;
    }
  }

  img2.updatePixels();
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
