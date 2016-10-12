// RandomFade
//
// A drunk walk with alpha fade using random.
//
// Dan Wilcox danomatika.com 2016

float x;
float y;

float velX = 8;
float velY = 4;

void setup() {
  size(400, 400);

  x = width/2;
  y = height/2;
}

void draw() {
  
  // alpha fade using rect
  fill(255, 4); // translucent white
  rect(0, 0, width, height);
  
  // step in a random direction
  x = x + random(-velX, velX);
  y = y + random(-velY, velY);
  
  // draw
  noStroke();
  fill(100, 100);
  ellipse(x, y, 40, 40);
}