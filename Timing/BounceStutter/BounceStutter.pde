// BounceStutter
//
// Animate a bouncing ball using a timer
// to stop & start the movement.
//
// Dan Wilcox danomatika.com 2016

float x, y;
float velX, velY;
boolean shouldMove = true;

void setup() {
  size(400, 400);
  
  x = random(width);
  y = random(height);
  
  velX = random(-4, 4);
  velY = random(-4, 4);
}

void draw() {
  background(100);
  
  // every 20 frames, toggle movement
  if(frameCount % 20 == 0) {
    shouldMove = !shouldMove;
  }

  // update position
  if(shouldMove) {
    x = x + velX;
    y = y + velY;
    if(x < 0 || x > width) {
      velX = -velX;
    }
    if(y < 0 || y > height) {
      velY = -velY;  
    }
  }
  
  // draw
  noStroke();
  ellipse(x, y, 40, 40);
}