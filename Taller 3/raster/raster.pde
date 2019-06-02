import nub.timing.*;
import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;

// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;
boolean antialias = true;
boolean colorEdges = true;

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = JAVA2D;

// 4. Window dimension
int dim = 10;

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  // not really needed here but create a spinning task
  // just to illustrate some nub.timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask() {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };
  scene.registerTask(spinningTask);

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  pushMatrix();
  pushStyle();
  scene.applyTransformation(node);
  triangleRaster();
  popStyle();
  popMatrix();
}

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  
  Vector p = new Vector(0,0);
  int paso = floor(width/pow( 2, n));
  
  pushStyle();
  stroke(255, 255, 0, 0);

  if(antialias){
    

    Vector p1 = new Vector(0,0);
    Vector p2 = new Vector(0,0);
    Vector p3 = new Vector(0,0);
    Vector p4 = new Vector(0,0);
    
    for(int i=-width/2; i<width/2; i += paso){
      for(int j=-width/2; j<width/2; j += paso){
        p = new Vector(i-(0.5*paso),j-(0.5*paso));
        p1 = new Vector(i,j);
        p2 = new Vector(i-(paso),j-(paso));
        p3 = new Vector(i,j-(paso));
        p4 = new Vector(i-(paso),j);
        
        float w10 = edgeFunction(v2, v3, p1);
        float w11 = edgeFunction(v3, v1, p1);
        float w12 = edgeFunction(v1, v2, p1);
        
        float w20 = edgeFunction(v2, v3, p2);
        float w21 = edgeFunction(v3, v1, p2);
        float w22 = edgeFunction(v1, v2, p2);
        
        float w30 = edgeFunction(v2, v3, p3);
        float w31 = edgeFunction(v3, v1, p3);
        float w32 = edgeFunction(v1, v2, p3);
        
        float w40 = edgeFunction(v2, v3, p4);
        float w41 = edgeFunction(v3, v1, p4);
        float w42 = edgeFunction(v1, v2, p4);
        
        float w0 = edgeFunction(v2, v3, p);
        float w1 = edgeFunction(v3, v1, p);
        float w2 = edgeFunction(v1, v2, p);
        
        boolean dentro1 = (w10 >= 0 && w11 >= 0 && w12 >= 0 || w10 < 0 && w11 < 0 && w12 < 0);
        boolean dentro2 = (w20 >= 0 && w21 >= 0 && w22 >= 0 || w20 < 0 && w21 < 0 && w22 < 0);
        boolean dentro3 = (w30 >= 0 && w31 >= 0 && w32 >= 0 || w30 < 0 && w31 < 0 && w32 < 0);
        boolean dentro4 = (w40 >= 0 && w41 >= 0 && w42 >= 0 || w40 < 0 && w41 < 0 && w42 < 0);
        boolean dentroCentro = (w0 >= 0 && w1 >= 0 && w2 >= 0 || w0 < 0 && w1 < 0 && w2 < 0);
        
        int suma = 0;
        float sum = 0, r = 0, g = 0, b = 0;
        
        if(dentroCentro){
          suma += 1;   
          sum = w0 + w1 + w2;
          r = 255 * w0/sum;
          g = 255 * w1/sum;
          b = 255 * w2/sum; 
        }
        if(dentro1){
          suma += 1;
          if(sum==0){
            sum = w0 + w1 + w2;
            r = 255 * w0/sum;
            g = 255 * w1/sum;
            b = 255 * w2/sum; 
          }
        }
        if(dentro2){
          suma += 1;   
          if(sum==0){
            sum = w0 + w1 + w2;
            r = 255 * w0/sum;
            g = 255 * w1/sum;
            b = 255 * w2/sum; 
          }
        }
        if(dentro3){
          suma += 1;   
          if(sum==0){
            sum = w0 + w1 + w2;
            r = 255 * w0/sum;
            g = 255 * w1/sum;
            b = 255 * w2/sum; 
          }
        }
        if(dentro4){
          suma += 1;   
          if(sum==0){
            sum = w0 + w1 + w2;
            r = 255 * w0/sum;
            g = 255 * w1/sum;
            b = 255 * w2/sum; 
          }
        }
        
        if (suma>0) {
       
          if(colorEdges){
            fill(r, g, b, 51*suma);
          }else{
            fill(#98e5d4, 51*suma);
          }
            
          rect(round(node.location(p).x())-1, round(node.location(p).y())-1,1,1);
          //circle(round(node.location(p).x())-0.5, round(node.location(p).y())-0.5,1);
        }
      }
    }
  }else{
    for(int i=-width/2; i<width/2; i += paso){
      for(int j=-width/2; j<width/2; j += paso){
        p = new Vector(i-(0.5*paso),j-(0.5*paso));
        
        float w0 = edgeFunction(v2, v3, p);
        float w1 = edgeFunction(v3, v1, p);
        float w2 = edgeFunction(v1, v2, p);      
        
        if ((w0 >= 0 && w1 >= 0 && w2 >= 0) || (w0 < 0 && w1 < 0 && w2 < 0)) {
          float sum = w0 + w1 + w2;
          
          float r = 255 * w0/sum;
          float g = 255 * w1/sum;
          float b = 255 * w2/sum; 
          if(colorEdges){
            fill(r, g, b);
          }else{
            fill(#98e5d4);
          }
          
          rect(round(node.location(p).x())-1, round(node.location(p).y())-1,1,1);
          //circle(round(node.location(p).x())-0.5, round(node.location(p).y())-0.5,1);
        }
      }
    }
  }
  popStyle();
  
}

float edgeFunction(Vector A, Vector B, Vector P)
{
    return ((P.x() - A.x())*(B.y() - A.y()) - (P.y() - A.y())*(B.x() - A.x()));
}   

void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;  
  //v1 = new Vector(-1024, -1024);
  //v2 = new Vector(-1024, 1024);
  //v3 = new Vector(1024, 1024);
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
  pushStyle();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  triangle(v1.x(), v1.y(), v2.x(), v2.y(), v3.x(), v3.y());
  strokeWeight(5);
  stroke(0, 255, 255);
  point(v1.x(), v1.y());
  point(v2.x(), v2.y());
  point(v3.x(), v3.y());
  popStyle();
}

void keyPressed() {
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 9 ? n+1 : 3;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >3 ? n-1 : 9;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run(20);
  if (key == 'y')
    yDirection = !yDirection;
  if (key == 'a')
    antialias = !antialias;
  if (key == 'c')
    colorEdges = !colorEdges;
}
