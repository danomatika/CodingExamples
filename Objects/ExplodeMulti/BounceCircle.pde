
// a new type of Circle, inherits from the Circle class
class BounceCircle extends Circle {
  
  // overrides the Circle constructor
  BounceCircle() {
    
    // this class the superclass's constructor,
    // in this case it calls Circle() so that
    // we get the initial default variable values
    super();
    
    // set some custom variables here that are different
    // from the default circle values
      
    // yellow
    fillColor = color(220, 220, 120);
  }
  
  // override the Circle update() function as we
  // want to impelement a new behavior:
  // window boundary checking
  void update() {
    
    // call the default Circle update() function
    // that moves the circle & checks it's age
    //
    // better to call the superclass function than
    // to write the same code here
    super.update();
    
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
  
}