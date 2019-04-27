import processing.video.*;
import processing.video.*;
Movie myMovie, myMovie2;

void setup() {
  size(1920, 540);
  background(0);
  myMovie = new Movie(this, "video.mp4");
  myMovie2 = new Movie(this, "video.mp4");
  myMovie.loop();
  myMovie2.loop();
}

void draw() {
  image(myMovie, 0, 0);
  image(myMovie2, myMovie2.width, 0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
