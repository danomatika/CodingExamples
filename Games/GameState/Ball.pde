
class Ball {
  
  PVector pos;
  PVector vel;
  
  // number of times the ball has hit the edge of the screen
  int bounces = 0;
  
  // is this ball awake & active?
  boolean awake = true;
  
  Ball() {
    reset();
  }
  
  Ball(float x, float y) {
    reset();
    pos = new PVector(x, y);
  }
  
  // reset to random pos & velocity
  void reset() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-4, 4), random(-4, 4));
    awake = true;
    bounces = 0;
  }
  
  void update() {
    // check edges
    if(pos.x < 0 || pos.x > width) {
      vel.x = -vel.x;  
      bounces = bounces+1;
    }
    if(pos.y < 0 || pos.y > height) {
      vel.y = -vel.y;
      bounces = bounces+1;
    }
    
    // after 4 bounces, this ball is tired and wants to sleep
    if(bounces >= 4) {
      awake = false;  
    }
    
    // move
    pos.add(vel);
  }
  
  void draw() {
    fill(255);
    stroke(0);
    ellipse(pos.x, pos.y, 12, 12);
  }
  
};