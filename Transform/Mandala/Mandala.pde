// Mandala
//
// Sin/cos template for making a mandala.
//
// Dan Wilcox danomatika.com 2016

float rotateAngle = 0;
float scaleAngle = 0;

void setup() {
  size(400, 400);
  
  // center rectangles
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  noStroke();
  fill(100);
  
  // move to the middle of the window
  translate(width/2, height/2);
  rotate(-rotateAngle); // rotate
  
  rect(0, 0, 50, 50);
  
  // scale circles in and out using sin
  scale(map(sin(scaleAngle), -1, 1, 0.25, 2));
  
  // draw a ring of 10 evenly spaced circles
  float stepAngle = TWO_PI/10;
  for(int i = 0; i < 10; ++i) {
    rotate(stepAngle);
    ellipse(100, 0, 50, 50);
  }

  // update animation variables
  rotateAngle = rotateAngle + 0.025;
  scaleAngle = scaleAngle + 0.025;
}