
// particle class manager
class Explosion {
 
  // our circles for the explosion
  ArrayList<Circle> circles;

  // whether we're done exploding or not
  boolean doneExploding = false;
  
  // create a random number of circles
  Explosion() {
    circles = new ArrayList<Circle>();
    int numCircles = int(random(20, 50));
    
    // randomly choose a circle type
    int which = int(random(4));
    
    for(int i = 0; i < numCircles; i++) {
      if(which == 0) { // default circle type
        Circle c = new Circle();
        circles.add(c);
      }
      else if(which == 1) { // a circle that moves down
        DownCircle c = new DownCircle();
        circles.add(c);
      }
      else if(which == 2) { // a circle that moves up
        UpCircle c = new UpCircle();
        circles.add(c);
      }
      else if(which == 3) { // a circle that bounces off the edges
        BounceCircle c = new BounceCircle();
        circles.add(c);
      }
    }
  }
  
  // set the circle positions
  void explodeAt(float x, float y) {
    for(int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);
      c.x = x;
      c.y = y;
    }
  }
  
  // update the circles
  void update() {
    for(int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);
      
      // move the circle & decide if it's alive or not
      c.update();
      
      // if the circle is dead, get rid of the body
      if(c.alive == false) {
        circles.remove(c);  
      }
     }
     
     // all the circles are dead, so we're done
     if(circles.size() == 0) {
       doneExploding = true;  
     }
  }
  
  // draw the circles
  void draw() {
    for(int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);
      c.draw();  
    }
  }
}