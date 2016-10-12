// Speed
//
// Simple 1D linear movement using speed & direction.
//
// Dan Wilcox danomatika.com 2016

float x = 20; // x position
float speed = 10.0; // speed in pixels
int radius = 100; // circle radius

void setup() {
  size(1024, 480);
}

void draw() {
  background(255);
 
  // calc speed modifier from mouse x pos
  float s = map(mouseX, 0, width, 0.5, 2.0);
 
  // update position,
  // adding to the pos -> move right
  // subtracting form pos -> move left
  x = x + speed*s;
 
  // stop when we get to the right edge
  //if(x >= width-radius) {
  //  x = width-radius;  
  //}
 
  //// wrap around once we go off the right edge
  //if(x >= width+radius) {
  //  x = -radius;  
  //}
 
  // change direction once we reach the edge of the window
  if(x > width-radius/2) { // right side
    x = width-radius/2; // reset to right limit
    speed = -speed; // change direction aka change sign
  }
  if( x < radius/2) { // left side
    x = radius/2;  // reset to left limit
    speed = -speed; // change direction
  }
 
  // draw the circle
  noStroke();
  fill(100);
  ellipse(x, height/2, radius*2, radius*2);
}