// ExplodeMulti
// 
// Uses class inheritance to generate
// different explosion types using different
// particle classes via class inheritance.
//
// Click to create a random explosion type.
//
// Dan Wilcox danomatika.com 2016

ArrayList<Explosion> explosions;

void setup() {
  size(400, 400, P3D);
  frameRate(60);
  
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