
// particle class
class Circle {
  
  float x, y; // position
  float velX, velY; // velocity
  float diameter; // size
  
  boolean alive = true; // is the circle currently alive?
  long birth; // when the circle was born
  long life; // number of ms this circle can stay alive
  
  // constructor
  Circle() {
    x = random(width);
    y = random(height);
    diameter = random(30, 50);
    velX = random(-8, 8);
    velY = random(-8, 8);
    birth = millis(); // the current time
    life = int(random(1000, 3000)); // random life span from 1-3 secs
  }
  
  // update the position & check if still alive
  void update() {
    
    // update the pos
    x = x + velX;
    y = y + velY;
    
    // check if the circle is dead aka life longer than 5 seconds
    // current time - when circle was born
    if(millis() - birth > life) {
      alive = false;
    }
  }
  
  // draw the circle to the screen
  void draw() {
    
    // fade the circle's alpha based on it's age
    // from 160 - 0 so it fades out
    long age = millis() - birth;
    float alpha = map(age, 0, life, 160, 0);
    
    // draw the circle
    noStroke();
    fill(200, 200, 200, alpha);
    ellipse(x, y, diameter, diameter);
  }
}