
class Circle {

  PVector pos;
  PVector vel;
  
  float diameter; // size
  
  float spring = 0.09;
  
  Circle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-4, 4), random(-4, 4));
    diameter = 100;
  }
  
  void update() {
     
    // update the position
    pos.add(vel);
     
    // boundary checks
    if(pos.x < diameter/2) {
      pos.x = diameter/2;
      vel.x = -vel.x;
    }
    else if(pos.x > width-diameter/2) {
      pos.x = width-diameter/2;
      vel.x = -vel.x;
    }
    if(pos.y < diameter/2) {
      pos.y = diameter/2;
      vel.y = -vel.y;
    }
    else if(pos.y > height-diameter/2) {
      pos.y = height-diameter/2;
      vel.y = -vel.y;
    }
  }
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  
  // adapted from the Processing BouncyBubbles example
  boolean collideWith(Circle other) {
    float dx = other.pos.x - pos.x;
    float dy = other.pos.y - pos.y;
    float distance = sqrt(dx*dx + dy*dy);
    float minDist = other.diameter/2 + diameter/2;
    if (distance < minDist) { 
      float angle = atan2(dy, dx);
      float targetX = pos.x + cos(angle) * minDist;
      float targetY = pos.y + sin(angle) * minDist;
      float ax = (targetX - other.pos.x) * spring;
      float ay = (targetY - other.pos.y) * spring;
      vel.x -= ax;
      vel.y -= ay;
      other.vel.x += ax;
      other.vel.y += ay;
      return true;
    }
    return false;
  }
  
  // algorithm from https://processing.org/discourse/beta/num_1223494826.html
  PVector intersectionWith(Circle other) {
    
    // distance between centers
    float d = dist(pos.x, pos.y, other.pos.x, other.pos.y);
    
    // circle radii
    float r1 = diameter/2;
    float r2 = other.diameter/2;
    
    float base, h; // auxiliary distances
    
    PVector point = new PVector(); // intersection point
  
    if(d < abs(r1-r2) || d > r1+r2) {
      return point;  // no intersection
    }
    else if(d == abs(r1 - r2)){
      // one inside the other, intersect in one point
      if(r1 > r2) {
        base = r1;
      }
      else {
        base = -r1;
      }
      point.x = pos.x + base * (other.pos.x - pos.x) / d;
      point.y = pos.y + base * (other.pos.y - pos.y) / d;
    }
    else if(d == r1 + r2) { // outside each other, intersect in one point
      base = r1;
      point.x = pos.x + base * (other.pos.x - pos.x) / d;
      point.y = pos.y + base * (other.pos.y - pos.y) / d;
    }
    else { // intersect in two points, we'll just choose the first
      base = (r1*r1 - r2*r2 + d*d)/(2*d);
      h = sqrt(r1*r1 - base*base);

      point.x = pos.x + base * (other.pos.x - pos.x) / d;
      point.y = pos.y + base * (other.pos.y - pos.y) / d;
      
      point.x = point.x + h*(other.pos.y - pos.y)/d;
      point.y = point.y - h*(other.pos.x - pos.x)/d;
    }
    
    return point;
  }
  
}