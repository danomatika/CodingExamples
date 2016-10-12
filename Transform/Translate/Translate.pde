// Translate
//
// Draw 2 circles at the mouse pos by translating.
//
// Dan Wilcox danomatika.com 2016

void setup() {
  size(400, 400);
}

void draw() {
  background(100);
  
  noStroke();
  fill(255);
  
  // save the current transform state:
  // translation, scale, rotate
  pushMatrix();
  
  // move the origin of the coordinate system
  // to the middle of the screen
  // upper left -> middle now (0,0)
  translate(width/2, height/2);
  ellipse(0, 0, 100, 100);

  // clear everything we did after pushMatrix()
  // resets the origin back to the upper left for us
  popMatrix();
  
  // save the transform state
  pushMatrix();
  
  // set origin to the mouse pos & draw a circle to the left and right
  translate(mouseX, mouseY);
  fill(220, 120, 120);
  ellipse(-50, 0, 100, 100); // left
  ellipse(50, 0, 100, 100); // right

  // undo everything after we're done drawing
  popMatrix();
}