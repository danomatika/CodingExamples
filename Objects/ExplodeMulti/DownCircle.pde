
// a new type of Circle, inherits from the Circle class
class DownCircle extends Circle {
  
  // overrides the Circle constructor
  DownCircle() {
    
    // this class the superclass's constructor,
    // in this case it calls Circle() so that
    // we get the initial default variable values
    super();
    
    // set some custom variables here that are different
    // from the default circle values
    
    // in this case, we want to circles to only move downward
    velX = random(-4, 4);
    velY = random(1, 8);
    
    // red
    fillColor = color(220, 120, 120);
  }
  
}