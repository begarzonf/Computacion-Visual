float movp = 0;
float movm = 920;

void setup()
{
  size(1000, 500);
  background(255);
  noStroke();
}

void draw()
{
  barras();

  if (movm==0){
    movp=0;
  }
  if(movp<=920){
    color amarillo = color(255,255,0);
    fill(amarillo);
    rect(movp,150,80,40);
  
    color azul = color(0,0,155);
    fill(azul);
    rect(movp,300,80,40);
    movp += 1.5;
  }else{
    color amarillo = color(255,255,0);
    fill(amarillo);
    rect(movm,150,80,40);
  
    color azul = color(0,0,155);
    fill(azul);
    rect(movm,300,80,40);
    movm -= 1.5;
  }
}

void barras()
{
  background(255);
  fill(0);
  for(int i=0; i<width; i++)
  {
    rect(i*20, 0, 10, 500);
  }
  
}
