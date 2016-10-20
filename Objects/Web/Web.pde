// Web
//
// A web of connected, bouncing circles
// using a class and an ArrayList.
//
// Add circles with the mouse & show their
// position with the spacebar. Toggle
// movement with the 'p' key and clear
// all circles with 'c'.
//
// Dan Wilcox danomatika.com 2016

ArrayList<Circle> circles;
int num = 10;
int maxNum = 200;
boolean paused = false;

void setup() {
  size(400, 400);
  
  // create array list & init any circles
  circles = new ArrayList<Circle>();
  for(int i = 0; i < num; ++i) {
    
    // create a new circle into a temp variable
    Circle c = new Circle();
    
    // add it to the end of the list
    circles.add(c);
  }
}

void draw() {
  background(100);
  
  // update and draw each circle
  for(int i = 0; i < circles.size(); ++i) {
    
    // get the current circle into a temp var
    Circle c1 = circles.get(i);
    
    // update position if not paused
    if(!paused) {
      c1.update();
    }
    
    // draw if the space bar is being held down
    if(keyPressed && key == ' ') {
      c1.draw();
    }
    
    // draw a line between this circle and the next,
    // make sure not to grab a position off the end of the
    // array aka "next circle" after the final circle
    Circle c2; // next circle temp var
    if(i < circles.size()-1) {
      // not at the end, so get next circle
      c2 = circles.get(i+1);
    }
    else {
      // at the end, so get the first circle (wrap around)
      c2 = circles.get(0);  
    }
    
    
    stroke(255);
    line(c1.x, c1.y, c2.x, c2.y);
  }
  
  // draw the number of circles as text
  fill(0);
  text(circles.size(), 10, 20);
  
  // draw paused status
  if(paused) {
    text("paused", width-50, 20);  
  }
}

// add a new circle at the mouse position
void mouseDragged() {
  Circle c = new Circle();
  c.x = mouseX;
  c.y = mouseY;
  circles.add(c);
  
  // check if we have too many, if so remove the first one
  if(circles.size() >= maxNum) {
    circles.remove(0); // remove the first circle  
  }
}

void keyPressed() {
  if(key == 'p') {
    // toggle paused boolean value
    paused = !paused;  
  }
  else if(key == 'c') {
    // clear aka delete all circles in the array list
    circles.clear();  
  }
}