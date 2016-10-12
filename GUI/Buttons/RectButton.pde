
// a rectangular button
class RectButton extends Button {
 
  float w, h;
  
  RectButton(float x, float y, float sw, float sh) {
    pos = new PVector(x, y);
    w = sw;
    h = sh;
  }
  
  void draw() {
    
    // call the Button draw() function
    super.draw();
    
    // draw the button
    noStroke();
    rect(pos.x-w/2, pos.y-w/2, w, h); // draw from the corner
  }
  
  // returns true if the given position was inside the button
  boolean inside(float x, float y) {
    if((x >= pos.x-w/2 && x <= pos.x+w/2) &&
       (y >= pos.y-h/2 && y <= pos.y+h/2)) {
      return true;
    }
    else {
      return false;
    }
  }
  
}