
// a new type of Circle, inherits from the Circle class
class UpCircle extends Circle {
  
  // overrides the Circle constructor
  UpCircle() {
    
    // this class the superclass's constructor,
    // in this case it calls Circle() so that
    // we get the initial default variable values
    super();
    
    // set some custom variables here that are different
    // from the default circle values
    
    // in this case, we want to circles to only move upward
    velX = random(-4, 4);
    velY = -random(1, 8); // go up, so negative
      
    // blue
    fillColor = color(120, 120, 220);
  }
  
}