// TrigWorm
//
// An accumulting worm using the sine & cosine math functions.
//
// Move the mouse to influnce the angles.
//
// Dan Wilcox danomatika.com 2016

float x, y;
float offsetX, offsetY;

float angleX = 0;
float angleY = 0;

void setup() {
 size(400, 400); 

  x = width/2;
  y = height/2;
  
  offsetX = 100;
  offsetY = 100;
}

void draw() {
  
  x = width/2 + sin(angleX) * offsetX;
  y = height/2 + cos(angleY) * offsetY;
  angleX = angleX + map(mouseX, 0, width, 0.001, 0.05);
  angleY = angleY + map(mouseY, 0, height, 0.001, 0.05);
  
  noStroke();
  fill(random(255));
  ellipse(x, y, 100, 100);
}