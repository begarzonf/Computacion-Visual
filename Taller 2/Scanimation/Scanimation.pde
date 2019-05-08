import gifAnimation.*;

PGraphics py;
PGraphics pg;
PImage img, img2, imgFinal;
int offset = 0;

void setup() {
  //size(460, 251);//bateria
  //size(498, 468);//mario
  size(523, 305);//bear
  colorMode(HSB);
  
  PImage[] allFrames = Gif.getPImages(this, "bear.gif");
  imgFinal = createImage(allFrames[0].width, allFrames[0].height, RGB);
  
  int numFrames = allFrames.length;
  
  //print(allFrames[0].height);
  print(imgFinal.pixels.length + " " + allFrames[0].pixels.length + " " + (allFrames[0].width + (allFrames[0].height-1)*allFrames[0].width));
  int num=1;
  for(int i=0; i<allFrames[0].width-1; i+=2){
    for(int j=0; j<allFrames[0].height; j++){
      if(i+j*width < allFrames[0].pixels.length){
        if(num==1){
          imgFinal.pixels[i+j*width] = allFrames[1].pixels[i+j*width];
          imgFinal.pixels[(i+1)+j*width] = allFrames[1].pixels[(i+1)+j*width];
        }
        else if(num==2){
          imgFinal.pixels[i+j*width] = allFrames[numFrames/4].pixels[i+j*width];
          imgFinal.pixels[(i+1)+j*width] = allFrames[numFrames/4].pixels[(i+1)+j*width];
        }
        else if(num==3){
          imgFinal.pixels[i+j*width] = allFrames[2*(numFrames/4)].pixels[i+j*width];
          imgFinal.pixels[(i+1)+j*width] = allFrames[2*(numFrames/4)].pixels[(i+1)+j*width];
        }
        else if(num==4){
          imgFinal.pixels[i+j*width] = allFrames[3*(numFrames/4)].pixels[i+j*width];
          imgFinal.pixels[(i+1)+j*width] = allFrames[3*(numFrames/4)].pixels[(i+1)+j*width];
        }else if(num==5){
          print(i+j*width + "\n");
          imgFinal.pixels[i+j*width] = allFrames[4*(numFrames/4)-1].pixels[i+j*width];
          imgFinal.pixels[(i+1)+j*width] = allFrames[4*(numFrames/4)-1].pixels[(i+1)+j*width];
        }
      }
    }
    if(num==5){
      num=1;
    }else{
      num+=1;
    }
  }
}
void draw() {
  
  image(imgFinal,0,0);
  fill(0);
  noStroke();
  int base = 300+offset;
  for (int i=0; i < 50; i++){
    rect(base,0,8,width);
    base = base + 10;
  }
}

void keyPressed() {
  if (key == 'd') {
    offset += 2;
  } else if(key == 'a') {
    offset -= 2;
  }
}  
