// SinBreathe
//
// Use sine to animate the size of a circle.
//
// Dan Wilcox danomatika.com 2015

// animation variables
float centerZoom = 0;

void setup() {
  size(400, 400);
  frameRate(60);
}

void draw() {
  background(200);
  
  // draw the circle
  noStroke();
  fill(#FF0000); // red
  ellipse(width/2, height/2, sin(centerZoom)*150+50, sin(centerZoom)*150+50);
  // ^ max size: 150 + 50 = 200, add 50 so the smallest the circle will get is 50

  // use positive part of sine curve from 0-PI
  if(centerZoom > PI) {
   centerZoom = 0;  // reset to 0
  }
  centerZoom = centerZoom+0.025; // step size
}