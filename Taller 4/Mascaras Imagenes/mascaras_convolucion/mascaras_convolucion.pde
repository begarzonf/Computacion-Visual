PGraphics py;
PGraphics pg;
PImage img;
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
                      { -1,  9, -1 },
                      { -1, -1, -1 } };
                    
void setup() {
  size(1000, 541, P3D);
  colorMode(HSB);
  img = loadImage("templo.jpg");
}

void draw() {
  image(img, 0, 0);
  int matrixsize = 3;
  loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      color c = convolution(x, y, blur, matrixsize, img);
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }

  updatePixels();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++ ) {
    for (int j = 0; j < matrixsize; j++ ) {
      
      // What pixel are we testing
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      
      // Make sure we haven't walked off the edge of the pixel array
      // It is often good when looking at neighboring pixels to make sure we have not gone off the edge of the pixel array by accident.
      loc = constrain(loc,0,img.pixels.length-1);
      
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  
  // Return the resulting color
  return color(rtotal,gtotal,btotal); 
}
