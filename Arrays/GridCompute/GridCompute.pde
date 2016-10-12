// GridCompute
//
// Dynamically calculate the size 
// & distance between circles in
// a 2D grid to fit within a given
// pixel size.
//
// Dan Wilcox danomatika.com 2016

// circle positions
float[] posX;
float[] posY;

// number of rows & cols
int rows = 4;
int cols = 4;

// calculated distance between circles
int xStep;
int yStep;

void setup() {
  size(400, 400);

  noStroke();
  
  // create arrays
  posX = new float[rows * cols];
  posY = new float[rows * cols];
  
  // init with full window size
  gridCompute(width, height);
}

void draw() {
  background(255);
  
  // randomly choose a new size every 50 frames
  if(frameCount % 50 == 0) {
    gridCompute(random(100, width), random(100, height));  
  }
  
  // draw
  fill(220, 100, 220);
  for(int i = 0; i < posX.length; ++i) {
    ellipse(posX[i], posY[i], xStep, yStep);
  }
}

void gridCompute(float w, float h) {
  int i = 0;
  xStep = int(w/float(cols));
  yStep = int(h/float(rows));
  println("steps: "+xStep+" "+yStep);
  for(int y = yStep/2; y < h; y = y+yStep) {
     for(int x = xStep/2; x < w; x = x+xStep) {
         posX[i] = x;
         posY[i] = y;
         i++;
     }
  }
}