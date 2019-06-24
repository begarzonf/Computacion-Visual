// Texture from Jason Liebig's FLICKR collection of vintage labels and wrappers:
// http://www.flickr.com/photos/jasonliebigstuff/3739263136/in/photostream/

PImage img;
float angle;

PShader edgesShader;

void setup() {
  size(1000, 541, P3D);
  img = loadImage("templo.jpg");
  //edgesShader = loadShader("blur.glsl");
  edgesShader = loadShader("emboss.glsl");
  //edgesShader = loadShader("edgeDetect.glsl");
  //edgesShader = loadShader("sharpen.glsl");
}

void draw() {    
  background(0);
  
  shader(edgesShader);
  
  image(img, 0, 0); 
}
