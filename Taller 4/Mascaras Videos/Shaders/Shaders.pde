import processing.video.*;
Movie myMovie;

PShader edgesShader;

void setup() {
  size(960, 540, P2D);
  background(0);
  myMovie = new Movie(this, "video.mp4");
  myMovie.loop();
  //edgesShader = loadShader("blur.glsl");
  edgesShader = loadShader("emboss.glsl");
  //edgesShader = loadShader("edgeDetect.glsl");
  //edgesShader = loadShader("sharpen.glsl");
}

void draw() {
  if(myMovie != null)
  {
    myMovie.read();
    image(myMovie, 0, 0);
  }
  shader(edgesShader);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  if (m == myMovie) {
    m.read();
  } 
}
