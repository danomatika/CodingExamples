// Bounce
//
// Animating a bouncing ball using 2D speed & direction.
//
// Dan Wilcox danomatika.com 2016

// current position
float x;
float y;

// current velocity
float velX;
float velY;

// how big?
float circleSize = 40;

void setup() {
 
  size(400, 400);
 
  // choose our starting pos
  x = random(width);
  y = random(height);
  
  // choose random velocity
  velX = random(-4, 4);
  velY = random(-4, 4);
}

void draw() {
 
  background(100);
  
  // x is our position, but also our animation variable
  // velX is how much to add to the position each frame
  x = x + velX;
  y = y + velY; // update Y too
  
  // if we reach the edge of the window, turn around
  if(x < circleSize/2) {
    x = circleSize/2; // move back
    velX = velX * -1; // turn around
  }
  if(x > width-circleSize/2) {
    x = width-circleSize/2; // move back
    velX = velX * -1; // turn around
  }
  if(y < circleSize/2) {
    y = circleSize/2; // move back
    velY = velY * -1; // turn around 
  }
  if (y > height-circleSize/2) {
    y = height-circleSize/2; // move back
    velY = velY * -1; // turn around 
  }
  
  // draw
  noStroke();
  ellipse(x, y, circleSize, circleSize);
}