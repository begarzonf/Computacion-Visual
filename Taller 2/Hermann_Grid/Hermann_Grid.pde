boolean esconder = false;

void setup()
{
  size(1400, 700);
  background(255);
  noStroke();
  
}

void draw()
{
  background(255);
  fill(0);
  if(!esconder){
    cuadros();
  }
  fill(255);  
}
void cuadros()
{
  for(int i=0; i<width; i++)
  {
    for(int j=0; j<height; j++){
      rect(i*80, j*80, 70,70);
  }
  }
}

void keyPressed() {
  if (key == 'b') {
    esconder = !esconder;
  }
}
