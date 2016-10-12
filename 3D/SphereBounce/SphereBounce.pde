// SphereBounce
//
// A bouncing animation in 3D.
//
// Dan Wilcox danomatika.com 2016

// Processing has "width" & "height" variables built in,
// but no "depth" so we make one here
int depth = 400;

Sphere sphere;

void setup() {
  size(400, 400, P3D);
  sphere = new Sphere();
}

void draw() {
  background(100);

  // center, then move back and rotate so we can see the "world"
  translate(width/2, 0, -depth-100);
  rotateY(map(mouseX, 0, width, -HALF_PI, HALF_PI));
  
  // draw the "world" aka the 3d bounding box for the sphere
  noFill();
  pushMatrix();
  translate(0, height/2, depth/2);
  stroke(0);
  box(width, height, depth);
  popMatrix();
  
  // update and draw the sphere
  translate(-width/2, 0);
  sphere.draw(); 
}