// MouseSquare
//
// An interactive program that draws
// a rectangle at the current mouse pos.
// Doesn't redraw the background.
//
// Dan Wilcox danomatika.com 2015

color bgColor = #FF00FF;

void setup() {
  size(400, 400);
  background(bgColor);
}

void draw() {
  rect(mouseX, mouseY, 20, 20);
}

// clear the background by clicking the mouse
void mousePressed() {
  background(bgColor);
}