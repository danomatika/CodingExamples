// Explode
//
// A simple explosion of Circles that
// demonstrates using a class within
// another class.
//
// Click to create an explosion.
//
// Dan Wilcox danomatika.com

ArrayList<Explosion> explosions;

void setup() {
  size(400, 400);

  explosions = new ArrayList<Explosion>();
}

void draw() {
  background(100);
  
  // update and draw the explosions
  for(int i = 0; i < explosions.size(); ++i) {
    Explosion e = explosions.get(i);
    e.update();
    if(e.doneExploding) { // done, so remove
      explosions.remove(e);  
    }
    else { // keep going
      e.draw();
    }
  }
  
  fill(255);
  textAlign(LEFT);
  text("num explosions: "+explosions.size(), 0, 10);
}

// add a new explosion where the mouse clicks
void mousePressed() {
  Explosion e = new Explosion();
  e.explodeAt(mouseX, mouseY);
  explosions.add(e);
}