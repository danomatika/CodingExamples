// ParticleFade
//
// Simple circle particles that live
// for a short time & fade away.
//
// Click to make a circle.
//
// Dan Wilcox danomatika.com 2016

ArrayList<Circle> circles;

void setup() {
  size(400, 400);
  
  // create the array list and load
  // it with 5 random circles
  circles = new ArrayList<Circle>();
  for(int i = 0; i < 5; ++i) {
    circles.add(new Circle());  
  }
}

void draw() {
  background(255);
  
  // draw each circle in the array list,
  // remove any dead circles
  for(int i = 0; i < circles.size(); ++i) {
    Circle c = circles.get(i);
    c.update();
    if(c.alive) {
      c.draw();  
    }
    else {
      circles.remove(c);  
    }
  }  
}

void mousePressed() {
  Circle c = new Circle(mouseX, mouseY);
  circles.add(c);
}