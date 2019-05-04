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
  if(myMovie != null)
  {
    myMovie.read();
    myMovie.read();
    image(myMovie, 0, 0);
    image(myMovie2, myMovie2.width, 0);
  }
  myMovie2.loadPixels();  

  
  
  myMovie2.updatePixels();
  textSize(28);
  text(getFrame() + " / " + (getLength() - 1), 10 , 30);
  text(String.valueOf(myMovie2.frameRate), myMovie2.width-100, 30);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  if (m == myMovie) {
    m.read();
  } else if (m == myMovie2) {
    m.read(); //<>//
    
    for (int loc = 0; loc < myMovie2.pixels.length; loc++) {      
    
    // Método 1 (promedio)    
    float r = red  (m.pixels[loc]);      
    float g = green(m.pixels[loc]);      
    float b = blue (m.pixels[loc]);      
    /*
    float promedio = r+g+b/3.0;
    
    m.pixels[loc] = color(promedio);
    */
    //Método 2 (tresshold)
    //myMovie2.pixels[loc] = ((brightness(myMovie.pixels[loc])>123)?color(0):color(255));
    
    //Método 3 (funcion)
    myMovie2.pixels[loc] = color(0.2627*r + 0.6780*g+0.0593*b);
  }  
  }
}

int getLength(){
  return int(myMovie2.duration() * myMovie2.frameRate);
}

int getFrame(){
  return ceil(myMovie2.time() * 30) - 1;
}
