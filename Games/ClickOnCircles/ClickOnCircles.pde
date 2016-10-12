// ClickOnCircles
//
// Simple game where you click on circles
// until they are all gone. Then new circles
// are generated.
//
// Dan Wilcox danomatika.com 2016

ArrayList<Circle> circles;

int numCircles = 5;

void setup() {
  size(400, 400);
  
  circles = new ArrayList<Circle>();
  
  // create some circles
  makeCircles(numCircles);
}

void draw() {
  background(200);
  
  // draw the circles
  for(int i = 0; i < circles.size(); ++i) {
    Circle c = circles.get(i);
    if(c.alive == true) {
      c.draw();  
    }
  }
  
  // if they are all gone, make some more...
  if(circles.size() == 0) {
      makeCircles(numCircles);
  }
  
}

void mousePressed() {
  
  // check if the mouse clicked on any of the circles
  for(int i = 0; i < circles.size(); ++i) {
    Circle c = circles.get(i);
    
    // if it was clicked on, it's dead
    // so remove it
    if(c.wasClicked(mouseX, mouseY)) {
      c.alive = false;
      println("removing circle at "+int(c.pos.x)+" "+int(c.pos.y));
      circles.remove(c);
    }
  }
}

void makeCircles(int num) {
  for(int i = 0; i < num; ++i) {
    Circle c = new Circle();
    circles.add(c);
  }
  println("made "+num+" circles");
}