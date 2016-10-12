// CirclesArray
//
// An array of Circle objects.
//
// Dan Wilcox danomatika.com 2016

// array of circles
Circle circles[];
int numCircles = 100;

void setup() {
  size(400, 400);

  // create an array of circles
  circles = new Circle[numCircles];
  for(int i = 0; i < numCircles; i++) {
    circles[i] = new Circle();  
  }
}

void draw() {
  background(100);
  
  // draw all the circles in the array
  for(int i = 0; i < circles.length; i++) {
      circles[i].update();
      circles[i].draw();
  }
}