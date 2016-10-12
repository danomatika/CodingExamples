// NoiseSquare
//
// Draws a rectangle using Perlin noise.
// Doesn't redraw the background.
//
// Dan Wilcox danomatika.com 2015

color bgColor = #FF00FF;

// Perlin noise values which change over time
float noiseX = 0;
float noiseY = 1;

// step amount between Perlin noise calculations,
// smaller = smaller steps, larger = larger steps
float noiseStep = 0.01;

 void setup() {
   size(400, 400);
   background(bgColor);
 }
 
 void draw() {
   // noise returns a value from 0-1, so multiple this by the
   // range we want, in this case 0-width & 0-height
   rect(noise(noiseX)*width, noise(noiseY)*height, 20, 20);
   noiseX = noiseX+0.01;
   noiseY = noiseY+0.01;
 }
 
  // clear the background by clicking the mouse
 void mousePressed() {
   background(bgColor);  
 }
 