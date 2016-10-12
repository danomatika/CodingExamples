
// a criclular button
class CircleButton extends Button {
 
  float diameter;
  
  CircleButton(float x, float y, float d) {
    pos = new PVector(x, y);
    diameter = d;
  }
  
  void draw() {
    
    // call the Button draw() function
    super.draw();
    
    // draw the button
    noStroke();
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  
  // returns true if the given position was inside the button
  boolean inside(float x, float y) {
    float d = dist(pos.x, pos.y, x, y);
    if(d <= diameter/2) {
      return true;
    }
    else {
      return false;
    }
  }
  
}