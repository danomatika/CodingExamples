
// a base circle class,
// default behavior is to start at a random position
// with a random velocity and move outward
class Circle {
  
  float x, y; // position
  float velX, velY; // velocity
  float diameter; // size
  color fillColor; // color
  
  boolean alive = true; // is the circle currently alive?
  long birthTime; // when the circle was born
  long life; // number of ms this circle can stay alive
  
  // constructor
  Circle() {
    // setup the initial values for the Circle
    x = random(width);
    y = random(height);
    diameter = random(30, 50);
    velX = random(-8, 8);
    velY = random(-8, 8);
    fillColor = color(200); // grey
    birthTime = millis(); // the current time
    life = int(random(1000, 3000));
  }
  
  // update the position & check if thie circle is still alive
  void update() {
    
    // update the pos
    x = x + velX;
    y = y + velY;
    
    // check if the circle is dead aka life longer
    // than it's lifetime: age = current time - when circle was born
    if(millis() - birthTime > life) {
      alive = false;
    }
  }
  
  // draw the circle to the screen
  void draw() {
    
    // fade the circle's alpha based on it's age
    // from 160 - 0 so it fades out
    long age = millis() - birthTime;
    float alpha = map(age, 0, life, 160, 0);
    
    // draw the circle
    noStroke();
    fill(red(fillColor), green(fillColor), blue(fillColor), alpha);
    ellipse(x, y, diameter, diameter);
  }
}