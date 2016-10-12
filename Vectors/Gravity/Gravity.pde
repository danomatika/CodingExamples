// Gravity
//
// Gravity simulation using PVectors for
// position, velocity, & acceleration.
//
// Click the mouse to drop the ball.
// Press the space ball to push it upwards.
//
// Dan Wilcox danomatika.com 2016

PVector pos;
PVector vel;
PVector acc;

PVector gravity;
PVector fan;

// how much energy to carry through when
// the ball bounces off the window edge
float damping = 0.8; // 80%

void setup() {
  size(400, 400);

  pos = new PVector(random(width), random(height));
  vel = new PVector(random(4), random(4));
  acc = new PVector(random(4), random(-4));

  gravity = new PVector(0, 1);
  fan = new PVector(0, -1.25);
}

void draw() {
  background(100);
  
  vel.add(gravity);
  
  // update the position
  pos.add(vel);
  
  // stay in the screen
  checkEdges();
  
  if(keyPressed && key == ' ') {
    // turn on fan for a second
    vel.add(fan);
    vel.limit(4);
  }
  
  // rollover check
  float d = dist(mouseX, mouseY, pos.x, pos.y);
  if(d < 50/2) {
    fill(200, 200, 100);  // gold
    if(mousePressed) {
      //acc.set(vel); // set acc to have values vel
      //acc.normalize(); // normalize to length 1
      //acc.mult(2); // multiple to 2
      //vel.add(acc); // add acceleration to the vel
      vel.mult(2);
      vel.limit(10); // keep things from going to fast
    }
  }
  else {
    fill(200, 100, 100); // red
  }
  ellipse(pos.x, pos.y, 50, 50);
}

void checkEdges() {
  
  // x axis
  if(pos.x < 0) {
    vel.x = -vel.x*damping;  
    pos.x = 0;
  }
  else if(pos.x > width) {
    vel.x = -vel.x*damping;
    pos.x = width;
  }
  
  if(pos.y < 0) {
    vel.y = -vel.y*damping;
    pos.y = 0;
  }
  else if(pos.y > height) {
    vel.y = -vel.y*damping;
    pos.y = height;
  }
}

void mousePressed() {
  pos.x = mouseX;
  pos.y = mouseY;
  vel.x = random(4);
  vel.y = random(4);
}