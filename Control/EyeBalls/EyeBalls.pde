// EyeBalls
//
// Draws a grid of eyeballs whose
// size are controlled by the mouse
// x position.
//
// Dan Wilcox danomatika.com 2016

void setup() {
  size(400, 400);  
  noStroke();
}

void draw() {
  background(100); // dark gray
  
  // mouse pos controls eye size aka 10% - 100%
  float eyeSize = map(mouseX, 0, width, 0.1, 1.0);
  
  // this draws a grid of eyeballs
  for(int y = 25; y < height; y = y + 50) {

     // this draws 1 row of eyeballs
    for(int x = 25; x < width; x = x + 50) {
    
      // this draws 1 eyeball
      fill(255); // white
      ellipse(x, y, 50*eyeSize, 50*eyeSize);
    
      fill(0); // black
      ellipse(x, y, 25*eyeSize, 25*eyeSize);
    }
  }
}