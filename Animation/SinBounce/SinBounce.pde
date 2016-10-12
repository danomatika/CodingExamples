// SinBounce
//
// Rectify the sin function output using the
// absolute value to simulate a bouncing ball.
//
// Dan Wilcox danomatika.com 2016

// current pos
float x, y;

// horz speed (linear)
float velX = 2;

// vertical pos on the sin curve
float angleY = 0.0;

// where the y pos is anchored to
float anchorY;

// how high to "bounce"
float offsetY = 200;

void setup() {
  size(800, 300); // widescreen
  
  // init positions
  x = 0;
  anchorY = height-10;
}

void draw() {
  
  // blended alpha background for trails
  fill(0, 0, 0, 1);
  rect(-1, -1, width+1, height+1);
  
  // update pos
  x = x + velX;
  y = anchorY - abs(sin(angleY)) * offsetY;
  angleY = angleY + 0.025;
  
  // check boundaries
  if(x < 0 || x > width) {
    velX = -velX; // turn around  
    angleY = angleY + 0.05;
  }
  
  // draw
  noStroke();
  fill(255);
  ellipse(x, y, 20, 20);
}