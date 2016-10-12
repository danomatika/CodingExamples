// Noise
//
// Move a circle & generate a background using Perlin noise.
//
// Hold the mouse button to update the background grid.
//
// Dan Wilcox danomatika.com 2016

// circle position variables
float x, y;
float anchorX, anchorY;
float offsetX = 100;
float offsetY = 100;

float angleX = 0.0;
float angleY = 0.015; // shift one of the angles

float noisePos = 0.0; // grid animation var 

void setup() {
  size(400, 400);
  
  anchorX = width/2;
  anchorY = height/2;
}

void draw() {
  background(100);
  
  // draw a grid, use 2d noise to compute the size
  for(int y = 20; y < height; y += 40) {
    for(int x = 20; x < width; x += 40) {
      fill(120, 120, 220);
      float circleSize = 20 * noise(x + noisePos, y + noisePos);
      ellipse(x, y, circleSize, circleSize);
    }
  }
  
  // update the pos
  x = anchorX + map(noise(angleX), 0.0, 1.0, -offsetX, offsetX);
  y = anchorY + map(noise(angleY), 0.0, 1.0, -1.0, 1.0) * offsetY;
  angleX = angleX + 0.015;
  angleY = angleY + 0.035;
  
  // draw the moving circle
  noStroke();
  fill(255);
  ellipse(x, y, 100, 100);
  
  // update grid noise pos
  if(mousePressed) {
    noisePos = noisePos + 0.01;  
  }
}