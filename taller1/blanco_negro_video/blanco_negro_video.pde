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
  myMovie2.loadPixels();  

  for (int loc = 0; loc < myMovie2.pixels.length; loc++) {      
    
    // Método 1 (promedio)    
    float r = red  (myMovie.pixels[loc]);      
    float g = green(myMovie.pixels[loc]);      
    float b = blue (myMovie.pixels[loc]);      
    
    float promedio = r+g+b/3.0;
    
    myMovie2.pixels[loc] = color(promedio);
    
    //Método 2 (tresshold)
    //myMovie2.pixels[loc] = ((brightness(myMovie.pixels[loc])>123)?color(0):color(255));
  }  
  

  myMovie2.updatePixels();  
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
