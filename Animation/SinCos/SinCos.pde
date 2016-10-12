// SinCos
//
// 2D movement using a combination of sin & cos
//
// Dan Wilcox danomatika.com 2016
//
// Helpful:
//
// Built in constants for radians:
// PI, TWO_PI, HALF_PI -> PI+TWO_PI
//
// If you like degrees instead:
// convert from degrees to radians with radians(90);

// current position
float x, y;

// position to be anchored around
float anchorX, anchorY;

// how much to move +/- around the anchor pos
float offsetX, offsetY;

// animation variable to give to sin/cos
float angleX = 0.0;
float angleY = PI;

void setup() {
  size(400, 400);
  
  anchorX = width/2;
  anchorY = height/2;
  
  offsetX = 150;
  offsetY = 150;
}

void draw() {
  
  // alpha blended background
  fill(0, 0, 0, 1);
  rect(-1, -1, width+1, height+1);
  
  // update the position
  x = anchorX + sin(angleX) * offsetX;
  y = anchorY + cos(angleY) * offsetY;
  
  // move the angle along the sin/cos curve
  angleX = angleX + 0.055; // <- play with this number
  angleY = angleY + 0.076; // <- play with this number
  
  // draw
  noStroke();
  fill(255);
  ellipse(x, y, 50, 50);
}