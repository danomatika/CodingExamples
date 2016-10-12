// EasingTarget
//
// 2D percentage interpolation towards a target.
//
// Click to set a new target position.
//
// Dan Wilcox danomatika.com 2016

// position
float x;
float y;

// percentage of how much to move toward the target each frame,
// ie. used to compute the velocity -> slower as we get closer
float easing = 0.05;

// target to move towards
float targetX;
float targetY;

void setup() {
  size(400, 400);
  
  x = random(width);
  y = random(height);
  
  targetX = width/2;
  targetY = height/2;
}

void draw() {
  background(100);
  
  // easing is kind of like a percentage,
  // how much to move toward the target each frame
  x = x + (targetX - x) * easing;
  y = y + (targetY - y) * easing;
  
  // draw the target
  fill(220, 120, 120);
  ellipse(targetX, targetY, 10, 10);
  
  // draw the circle
  noStroke();
  fill(255);
  ellipse(x, y, 20, 20);
  
  // reset position with spacebar
  if(keyPressed) {
    if(key == ' ') {
      x = random(width);
      y = random(height);
      targetX = random(width);
      targetY = random(height);
    }
  }
  
  // set the target to the mouse pos when clicked
  if(mousePressed) {
    targetX = mouseX;
    targetY = mouseY;
  }
}