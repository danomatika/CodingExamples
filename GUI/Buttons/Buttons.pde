// Buttons
//
// Simple buttons using circle & rectangle using class inheritance.
//
// Click on the buttons with the mouse.
//
// Dan Wilcox danomatika.com 2016

CircleButton cButton;
RectButton rButton;

// default background color
color bg = color(100);

void setup() {
  size(400, 400);  
  
  // create the buttons
  cButton = new CircleButton(width/2, height * 0.25, 100);
  rButton = new RectButton(width/2, height * 0.75, 100, 100);

  // green color
  rButton.normalColor = color(120, 220, 120);
}

void draw() {
  background(bg);
  
  // update/draw the buttons
  cButton.draw();
  rButton.draw();
}

// click the buttons
void mousePressed() {
  if(cButton.click()) {
    println("hello");
    bg = color(0);
  }
  if(rButton.click()) {
    println("world");
    bg = color(255);  
  }
}