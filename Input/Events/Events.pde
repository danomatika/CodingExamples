// Events
//
// Event callback functions demo.
//
// Dan Wilcox danomatika.com 2016

color ellipseColor = color(220, 120, 120);

// callback at the beginning of the sketch
void setup() {
    size(400, 400);
}

// callback for every frame
void draw() {
  background(100);
  
  // built in input event variables
  // mouseX, mouseY, mousePressed, mouseButton
  // key, keyCode, keyPressed
  
  // the problem here is that it will always print
  // even if we only want it to print the first time the
  // mouse button was pressed
  //if(mousePressed) {
  //   println("foo bar"); 
  //}
  
  noStroke();
  fill(ellipseColor);
  ellipse(width/2, height/2, 100, 100);
}

// event functions

// callback for when a mouse button is pressed down
// only called once!
void mousePressed() {
  println("mousePressed "+frameCount);
  if(mouseButton == LEFT) {
    ellipseColor = color(220, 220, 120);
  }
  else {
    ellipseColor = color(220, 120, 120);
  }
}

// callback for when a mouse button is released
// only called once per button/action
void mouseReleased() {
  println("mouseReleased "+frameCount);
  ellipseColor = color(120, 220, 220);
}

// callaback for when a key is pressed down
// if multiple keys are pressed at once, this function
// will be called once for each key
void keyPressed() {
  println("keyPressed "+key);
}

// callback for when a key is let up
void keyReleased() {
  println("keyReleased "+key);
}