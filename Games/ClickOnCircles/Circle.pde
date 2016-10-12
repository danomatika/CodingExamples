
class Circle {
  
  PVector pos;
  float diameter;
  
  boolean alive = true;
  
  Circle() {
    diameter = random(40, 100);
    pos = new PVector();
    pos.x = random(diameter/2, width-diameter/2);
    pos.y = random(diameter/2, height-diameter/2);
  }
  
  void draw() {
    fill(100);
    ellipse(pos.x, pos.y, diameter, diameter);  
  }
  
  boolean wasClicked(int x, int y) {
    float d = dist(pos.x, pos.y, x, y);
    if(d <= diameter/2) {
      return true;
    }
    else {
      return false;
    }
  }
}