// WhiskerSquares
//
// Rotating squares with whiskers.
//
// Dan Wilcox danomatika.com 2015

float rotateVal = PI;

void setup() {
  size(400, 400); 
  rectMode(CENTER);
}

void draw() {
  background(200);
  
  drawSquare(100, 100, 50, 1);   // upper left
  drawSquare(300, 100, 100, -1); // upper right
  drawSquare(300, 300, 50, 1);   // lower right
  drawSquare(100, 300, 100, -1); // lower left
  
  // animation variables
  rotateVal = rotateVal + 0.01;
  if(rotateVal < PI) { // use ony positive part of sin 0-PI
   rotateVal = 0;
  }
}

// draw a centered square t a give location
// x & y: center point
// s: size in pixels
// r: rotation modifier, ie. setting to -1 rotates backwards
void drawSquare(float x, float y, float s, float r) {
  
  // push current transforms
  pushMatrix();
  
    // move the origin to middle of the screen
    translate(x, y);
    
    // rotate around the current origin
    rotate(r*sin(rotateVal));
    
    // draw centered on the current origin
    rect(0, 0, s, s);
    
    // draw the whiskers
    line(0, 0, -100, 100);
    line(0, 0, 100, -100);
    
  popMatrix(); // reset transforms before pushMatrix
}