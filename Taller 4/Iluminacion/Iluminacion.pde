PShape can;
float angle;

PShader pixlightShader;

void setup() {
  size(640, 360, P3D);
  can = createCan(100, 200, 32);
  pixlightShader = loadShader("pixlightfrag.glsl", "pixlightvert.glsl");
}

void draw() {    
  background(0);
  

  
  //pointLight(255, 200, 10, width/2, height, 200);
 
  //pointLight(51, 102, 126, 35, 40, 36);
  pointLight(51, 102, 126, 0, height/2, 36);
  pointLight(51, 102, 126, width, height/2, 36);
  //pointLight(51, 102, 126, width, height/2, 36);
  shader(pixlightShader);
  
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}
