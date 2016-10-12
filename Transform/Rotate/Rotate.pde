// Rotate
//
// Rotate a rectangle around a circle using the mouse.
//
// Dan Wilcox danomatika.com 2016

void setup() {
  size(400, 400);  

  rectMode(CENTER);
}

void draw() {
  background(100);
  
  noStroke();
  fill(255);
  
  // calculate rotation from mouseX pos
  float degrees = map(mouseX, 0, width, 0, 360);
  
  // move origin to middle
  translate(width/2, height/2);
  
  ellipse(0, 0, 100, 100);
  
  // rotate around the origin, convert from degrees to radians
  rotate(radians(degrees));
 
  rect(100, 0, 100, 200);
}