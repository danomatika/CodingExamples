// SquareBounce
//
// A rectangle bounces around the screen
// using simple physics & edge detection.
//
// Dan Wilcox danomatika.com 2015

// vectors contain an x, y, & z value
PVector pos; // current position
PVector vel; // current velocity

void setup() {
  size(400, 400);
  
  // create and set default vals
  pos = new PVector(width/2, height/2);
  vel = new PVector(2, -3);
  
  rectMode(CENTER);
  frameRate(60);
}

void draw() {
  background(200);
  
  // move the position each frame
  pos.add(vel); // pos = pos + vel
  
  // simple edge collision detection
  if(pos.x < 0) { // horz edges
    pos.x = 0;
    vel.x = -vel.x; // turn around 
  }
  if(pos.x > width) {
    pos.x = width;
    vel.x = -vel.x; // turn around
  }
  if(pos.y < 0) { // vert edges
    pos.y = 0;
    vel.y = -vel.y; // turn around
  }
  if(pos.y > height) {
    pos.y = height;
    vel.y = -vel.y; // turn around 
  }
  
  // draw the rect
  rect(pos.x, pos.y, 20, 20);
}

// reset current pos to the mouse pos and choose
// a random vel
void mousePressed() {
  pos.x = mouseX;
  pos.y = mouseY;
  vel.x = random(-2, 2);
  vel.y = random(-3, 3);
}