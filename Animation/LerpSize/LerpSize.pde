
// LerpSize
//
// Animate the size of a circle using lerp.
// Press the mouse to reset.
//
// Dan Wilcox danomatika.com 2016

float start = 100;
float end = 300;

float percent = 0;
float speed = 0.01;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  float s = lerp(start, end, percent);
  noStroke();
  fill(100);
  ellipse(width/2, height/2, s, s);
  
  percent += speed;
  if(percent > 1.0) {
    percent = 1.0;
  }
}

void mousePressed() {
  percent = 0.0; 
}