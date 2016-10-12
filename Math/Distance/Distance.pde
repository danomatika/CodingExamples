// Distance
//
// Calculate the distance between 2 points. In this case,
// used to compare how far the mouse is from the circle
// and decide if the mouse is inside or outside the circle's
// radius.
//
// Move the mouse over the circle.
//
// Dan Wilcox danomatika.com 2016

// circle pos
float x, y;

// how big?
float circleSize = 100;

void setup() {
  size(400, 400);
  
  // center
  x = width/2;
  y = height/2;
}

void draw() {
  background(100);
  
  // how far is the mouse from the circle pos?
  float d = dist(mouseX, mouseY, x, y);
  
  // check for overlaps, if the distance between the mouse
  // & the circle is less than the sum of it's radii, the
  // mouse is inside the circle
  if(d < circleSize) {
    fill(220, 220, 120); // gold
  }
  else {
    fill(255); // white 
  }
  
  // draw the circle
  noStroke();
  ellipse(x, y, circleSize, circleSize);
}