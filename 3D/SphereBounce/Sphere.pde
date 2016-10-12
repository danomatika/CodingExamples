
// a bouncing sphere
class Sphere {
 
  PVector pos;
  PVector vel;
  float diameter = 50;
  
  // random 3D pos & vel
  Sphere() {
    pos = new PVector(random(width), random(height), random(depth));
    vel = new PVector(random(-8, 8), random(-8, 8), random(-8, 8));
  }
  
  void draw() {
    
    // update the position with the velocity
    pos.add(vel);  
  
    // check left & right
    if(pos.x < diameter) {
      vel.x = -vel.x;
      pos.x = diameter;
    }
    else if(pos.x > width-diameter) {
      vel.x = -vel.x;
      pos.x = width-diameter;
    }
    
    // check top & bottom
    if(pos.y < diameter) {
      vel.y = -vel.y;
      pos.y = diameter;
    }
    else if(pos.y > height-diameter) {
      vel.y = -vel.y;
      pos.y = width-diameter;
    }
    
    // check front & back
    if(pos.z < diameter) {
      vel.z = -vel.z;
      pos.z = diameter;
    }
    else if(pos.z > depth-diameter) {
      vel.z = -vel.z;
      pos.z = depth-diameter;
    }
    
    // draw, translate before drawing sphere as the
    // sphere() function does not take any position parameters
    noFill();
    stroke(200);
    pushMatrix();
      translate(pos.x, pos.y, pos.z);
      sphere(diameter);
    popMatrix();
  }
}