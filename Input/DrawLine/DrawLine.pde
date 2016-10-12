// DrawLine
//
// Draw a line by connecting the
// previous mouse pos to the current
// mouse pos.
//
// Dan Wilcox danomatika.com 2016

float xPos, yPos;
float vel = 1;

void setup() {
  size(400, 400);
}

void draw() {
  strokeWeight(4);
  noFill();
  stroke(0, 102);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY); 
  }
}

void mousePressed() {
  background(200);  
}