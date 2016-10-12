// MoonSweep
//
// Animate light movement around a sphere to simulate moon phases.
//
// Click to reset the light position.
//
// Dan Wilcox danomatika.com 2016

float angle = QUARTER_PI;
float speed = 0.01;

void setup() {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw() {
  noStroke(); 
  background(0);
  
  // move the light
  angle = angle + speed;
  
  // move the light until it's behind the sphere,
  // 0.5 is a "magic number" to nudge the light back
  // just enough otherwise there is a slight crescent
  // on the left side when it stops
  //if(angle < TWO_PI + QUARTER_PI-0.5) { 
  //   angle = angle + speed;
  //}
  
  // set the light
  float dirX = sin(angle); 
  float dirZ = cos(angle);
  directionalLight(204, 204, 204, dirX, 0, dirZ); 
  
  // draw the sphere (with lighting)
  translate(width/2, height/2, 0);
  fill(200);
  sphere(80);
  
  // draw the light source (without lighting)
  noLights();
  translate(-dirX*width/2, 0, -dirZ*100);
  fill(255);
  sphere(10);
  lights();
}

void mousePressed() {
  // reset light position
  angle = QUARTER_PI-0.5;  
}