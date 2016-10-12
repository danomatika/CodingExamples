// CircleObject
//
// Uses a custom class to create a 
// "Circle" object type.
//
// Dan Wilcox danomatika.com 2016

// declare the circle as a variable
Circle circle;

void setup() {
  size(400, 400);
  
  // create a new circle
  circle = new Circle();
  
  // set the velocity of the circle
  circle.velX = 3;
  circle.velY = 4;
}

void draw() {
  background(100);
  
  // update and draw
  circle.update();
  circle.draw();
}