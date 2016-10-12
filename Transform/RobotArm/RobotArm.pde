// RobotArm
// 
// Robot arm simulation via translate & rotate.
//
// Move the mouse up and down to control the arm.
//
// Dan Wilcox danomatika.com 2016

int x, y;
float angle = 0;

void setup() {
  size(400, 400); 

  // starting pos
  x = 50;
  y = height/2;
}

void draw() {
  background(255);
  
  stroke(100, 127);
  
  angle = radians(map(mouseY, 0, height, -45, 45));
  
  // first segment
  translate(x, y);
  rotate(angle);
  strokeWeight(40);
  line(0, 0, 100, 0);
  
  // second segment
  translate(100, 0);
  rotate(angle * 0.9);
  strokeWeight(30);
  line(0, 0, 75, 0);
 
  // third segment
  translate(75, 0);
  rotate(angle * 0.8);
  strokeWeight(20);
  line(0, 0, 40, 0);
  
  // fourth segment
  translate(40, 0);
  rotate(angle * 0.5);
  strokeWeight(10);
  line(0, 0, 20, 0);
}