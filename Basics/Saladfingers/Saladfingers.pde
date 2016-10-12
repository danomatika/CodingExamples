// Saladfingers
//
// Draws a simplified face and eyeballs
// at a random location behind it using
// a custom function.
// Doesn't redraw background.
//
// Dan Wilcox danomatika.com 2015

void setup() {
  size(400, 400);
}

void draw() {

  // eye at a random location
  drawEye(random(width), random(height), 0);
  
  // head
  fill(255);
  ellipse(width/2, height/2, 170, 300);
  
  // two eyes with slightly askew pupils
  drawEye(width/2-50, height/2-20, -1.5);
  drawEye(width/2+50, height/2-20, 1.5);
}

// my own custom eyeball function
// x & y are position of the eye,
// offset is how much to shift the pupil horizontally:
// 0 stays centered, negative goes left, positive goes right
void drawEye(float x, float y, float offset) {
  
  // eye ball
  stroke(0); // black
  fill(255);
  ellipse(x, y, 20, 20);
  
  // pupil
  noStroke();
  fill(70); // darker grey
  ellipse(x+offset, y, 10, 10);
}