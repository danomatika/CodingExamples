// CircleIntersection
//
// Compute & display the first intersection
// between two circles.
//
// Dan Wilcox danomatika.com 2016

PVector circle1;
PVector circle2;

float circleSize1 = 100;
float circleSize2 = 100;

void setup() {
  size(400, 400);
  
  circle1 = new PVector(width/2, height/2);
  circle2 = new PVector();

  noStroke();
}

void draw() {
  background(100); 
  
  circle2.x = mouseX;
  circle2.y = mouseY;
  
  // stationary circle
  fill(220, 220, 120, 200);
  ellipse(circle1.x, circle1.y, circleSize1, circleSize1);
  
  // mouse circle
  fill(220, 120, 120, 200);
  ellipse(circle2.x, circle2.y, circleSize2, circleSize2);
  
  if(checkCollision(circle1, circleSize1, circle2, circleSize2)) {
    PVector p = getIntersection(circle1, circleSize1, circle2, circleSize1);
    
    // intersection
    fill(120, 120, 220);
    ellipse(p.x, p.y, 12, 12);
  }
}

boolean checkCollision(PVector pos1, float size1, PVector pos2, float size2) {
    float d = pos1.dist(pos2);
    if(d < size1/2+size2/2) {
      return true;  
    }
    return false;
  }
  
// algorithm from https://processing.org/discourse/beta/num_1223494826.html
PVector getIntersection(PVector pos1, float size1, PVector pos2, float size2) {
  
  // distance between centers
  float d = dist(pos1.x, pos1.y, pos2.x, pos2.y);
  
  // circle radii
  float r1 = size1/2;
  float r2 = size2/2;
  
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
    point.x = pos1.x + base * (pos2.x - pos1.x) / d;
    point.y = pos1.y + base * (pos2.y - pos1.y) / d;
  }
  else if(d == r1 + r2) { // outside each other, intersect in one point
    base = r1;
    point.x = pos1.x + base * (pos2.x - pos1.x) / d;
    point.y = pos1.y + base * (pos2.y - pos1.y) / d;
  }
  else { // intersect in two points, we'll just choose the first
    base = (r1*r1 - r2*r2 + d*d)/(2*d);
    h = sqrt(r1*r1 - base*base);

    point.x = pos1.x + base * (pos2.x - pos1.x) / d;
    point.y = pos1.y + base * (pos2.y - pos1.y) / d;
    
    point.x = point.x + h*(pos2.y - pos1.y)/d;
    point.y = point.y - h*(pos2.x - pos1.x)/d;
  }
  
  return point;
}