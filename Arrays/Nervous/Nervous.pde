// Nervous
//
// Draw a number of particles which jitter
// in place. Uses a 2d array to store the
// precomputed positions.
//
// Dan Wilcox danomatika.com 2016

// 2d array
float points[][];

// static define, useful for small data sets
// float points[][] = {
//  {100, 100},  
//  {200, 200}
//};

int num = 200;

void setup() {
  size(400, 400);
  frameRate(24);
  
  // create and load the array with random positions
  points = new float[num][2];
  for(int i = 0; i < points.length; ++i) {
    points[i][0] = random(width);
    points[i][1] = random(height);
  }
}

void draw() {
  background(100);
  fill(200);
  noStroke();
  
  // draw each position & jitter in place using random
  for(int i = 0; i < points.length; ++i) {
    float x = points[i][0] + random(-5, 5);
    float y = points[i][1] + random(-5, 5);
    ellipse(x, y, 20, 20);  
  }
}