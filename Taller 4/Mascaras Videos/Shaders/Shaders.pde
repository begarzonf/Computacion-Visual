// Texture from Jason Liebig's FLICKR collection of vintage labels and wrappers:
// http://www.flickr.com/photos/jasonliebigstuff/3739263136/in/photostream/

import processing.video.*;
import processing.video.*;
Movie myMovie;

PShader edgesShader;

void setup() {
  size(960, 540);
  background(0);
  myMovie = new Movie(this, "video.mp4");
  myMovie.loop();
  //edgesShader = loadShader("blur.glsl");
  //edgesShader = loadShader("emboss.glsl");
  //edgesShader = loadShader("edgeDetect.glsl");
  //edgesShader = loadShader("sharpen.glsl");
}

void draw() {    
  
  //shader(edgesShader);
  
  
  if(myMovie != null)
  {
    myMovie.read();
    image(myMovie, 0, 0);
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
