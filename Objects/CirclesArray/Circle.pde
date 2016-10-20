
// I have an object called "Circle"
class Circle {
  
  // define what a circle has & what it does
  
  // what a circle has:
  
  float x, y; // position
  float velX, velY; // velocity
  float diameter; // size
  
  // what a circle does:
  
  // constructor: called when we create a new circle
  // kind of like setup()
  Circle() {
    // setup the initial values for the circle
    x = random(width);
    y = random(height);
    diameter = random(10, 50);
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
    }
    else if(x > width) {
      velX = -velX;
      x = width;
    }
    if(y < 0) {
      velY = -velY;
      y = 0;
    }
    else if(y > height) {
      velY = -velY;
      y = height;
    }
  }
  
  // draw the circle to the screen
  void draw() {
    noStroke();
    fill(200);
    ellipse(x, y, diameter, diameter);
  }
}