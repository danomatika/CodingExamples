// Specks
//
// Visualize circle collision intersections.
//
// Hold the spacebar to see the moving circles.
// Press the mouse button to clear the stored
// intersections.
//
// Dan Wilcox danomatika.com 2016

ArrayList<Circle> circles;
ArrayList<PVector> intersections;

boolean shouldUpdate = true;

void setup() {
  size(400, 400);
  
  circles = new ArrayList<Circle>();
  for(int i = 0; i < 2; ++i) {
    Circle c = new Circle(random(width), random(height));
    circles.add(c);  
  }
  
  intersections = new ArrayList<PVector>();
  
  noStroke();
}

void draw() {
  background(100);
  
  for(int i = 0; i < 2; ++i) {
    Circle c = circles.get(i);
    
    if(shouldUpdate) {
      c.update();
    
      // check collision with *all* other circles
      for(int j = 0; j < 2; ++j) {
        Circle other = circles.get(j);
        if(other != c) { // don't check with itself!
            if(c.collideWith(other)) {
              // add intersction to array
              PVector point = c.intersectionWith(other);
              intersections.add(point);
            }
        }
      }
    }
    
    if(keyPressed & key == ' ') {
      c.draw();
    }
  }
  
  // draw the intersections
  fill(220, 120, 120, 200);
  for(int i = 0; i < intersections.size(); ++i) {
    PVector p = intersections.get(i);
    ellipse(p.x, p.y, 12, 12);
  }
}

void mousePressed() {
  intersections.clear();
}