
class Circle {
  
  float x, y; // position
  float velX, velY; // velocity
  float diameter; // size
  
  int bounces; // number of screen bounces
  
  // constructor
  Circle() {
    // setup the initial values for the circle
    x = random(width);
    y = random(height);
    diameter = random(30, 50);
    velX = random(-4, 4);
    velY = random(-4, 4);
  }
  
  // update the position & check the bounds so the
  // Circle doesn't go off the screen
  void update() {
    
    // update the pos
    x = x + velX;
    y = y + velY;
    
    // check boundaries
    if(x < 0) {
      velX = -velX;
      x = 0;
      bounces++;
    }
    else if(x > width) {
      velX = -velX;
      x = width;
      bounces++;
    }
    if(y < 0) {
      velY = -velY;
      y = 0;
      bounces++;
    }
    else if(y > height) {
      velY = -velY;
      y = height;
      bounces++;
    }
  }
  
  // draw the circle to the screen
  void draw() {
    noStroke();
    fill(200);
    ellipse(x, y, diameter, diameter);
    
    fill(0);
    textAlign(CENTER);
    text(bounces, x, y);
  }
}