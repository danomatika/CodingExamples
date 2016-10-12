// Scale
//
// Scale two circles based on the mouseY pos.
//
// Dan Wilcox danomatika.com 2016

void setup() {
  size(400, 400);
}

void draw() {
  background(100);
  
  noStroke();
  fill(255);
  
  // isolate the transforms within a push/pop
  pushMatrix();
  
  // draw a circle in the middle
  translate(width/2, height/2);
  scale(2.0); // make everything 2 times bigger
  //scale(0.5); // make everything half as big
  ellipse(0, 0, 100, 100);
  
  popMatrix();
  
  // compute scale amount based on mouseY pos
  float s = map(mouseY, 0, width, 0.25, 4.0);
  
  // draws 2 circles on either side of the mouse
  pushMatrix();
  
  // translate first!
  translate(mouseX, mouseY);
  
  // then scale so the coordinates are relative to the size
  scale(s);
  
  // draw two ellipses next to each other
  fill(220, 220, 120);
  ellipse(-50, 0, 100, 100);
  ellipse(50, 0, 100, 100);
  
  popMatrix();
  
}