// LerpTarget
//
// Linear interpolation towards a target.
//
// Move the mouse and the circle will follow.
//
// Dan Wilcox danomatika.com 2016

float x, y;
float targetX, targetY;

// lerp position, percentage 0-1 where:
// 0.0 aka 0% is at the start value
// 1.0 aka 100% is at the end value
// &
// 0.5 aka 50% is half way between, etc
float lpos = 0; 

void setup() {
  size(400, 400);
  
  x = 0;
  y = height/2;
  
  targetX = width-20;
  targetY = 0;
}

void draw() {
  background(100);
  
  x = lerp(x, mouseX, lpos);
  y = lerp(y, mouseY, lpos);
  if(lpos < 1.0) { // move if not at 1.0 aka 100%
    lpos = lpos + 0.0001;
  }
  
  noStroke();
  ellipse(x, y, 40, 40);
}