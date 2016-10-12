// CirclesArrayList
//
// Demonstrates using an ArrayList instead of
// an array to dynamically add & remove objects.
//
// Click to create a new circle.
//
// Dan Wilcox danomatika.com 2016

// ArrayList of circles
ArrayList<Circle> circles;
int numCircles = 20;

// the max number of allowed bounces
// before removing a circle
int maxBounces = 4;

void setup() {
  size(400, 400);

  // create an array of circles
  circles = new ArrayList<Circle>();
  for(int i = 0; i < numCircles; i++) {
    Circle c = new Circle();
    circles.add(c);  
  }
}

void draw() {
  background(100);
  
  // draw all the circles in the array
  for(int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);  
    c.update();
    if(c.bounces < maxBounces) {
      c.draw();
    }
    else {
      circles.remove(i); // remove the circle at this position  
    }
  }
  
  // draw some helper text
  fill(255);
  textAlign(LEFT);
  text("num circles: "+circles.size(), 0, 10);
  text("max bounces: "+maxBounces+ " (-/+)", 0, 24);
}

void keyPressed() {

    // decrease maxBounces with -
    if(key == '-') {
      maxBounces--;
      
      // don't let maxBounces be less than 1
      if(maxBounces < 1) {
        maxBounces = 1;  
      }
    }
    // increase maxBounces with =
    else if(key == '=') {
      maxBounces++;
      if(maxBounces > 20) {
        maxBounces = 20;  
      }
    }
}

void mousePressed() {
  Circle c = new Circle();
  c.x = mouseX;
  c.y = mouseY;
  circles.add(c);
}