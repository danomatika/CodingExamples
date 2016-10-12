
// Dakka Dakka Dakka
class Laser extends Object {
  // f is the lifespan of the laser
  // e is the total runtime of the laser
  int e, f;

  Laser(float x, float y, float a, float v, float r, int c, int f) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = r;
    this.w = 0;
    // The size of all lasers is 4
    this.s = 4;
    // Laser types:
    // -1. Basic Laser
    // -2. Twin Laser
    // -3. Tri Laser]
    // -5. Burst Laser
    // -6. Railgun
    // -9. Beam Laser
    // -1001. Seeker Missiles
    this.c = c;
    this.e = 0;
    this.f = f;
  }

  // Renders the laser
  void show() {
    switch(c) {
    case -1: 
      stroke(0, 255, 255, 255 - e*3);
      break;
    case -2: 
      stroke(32, 255, 255, 255 - e*6);
      break;
    case -3: 
      stroke(64, 255, 255, 255 - e*3);
      break;
    case -4: 
      stroke(128, 255, 255, 255 - e*3);
      break;
    case -5: 
      stroke(96, 255, 255, 255 - e*12);
      break;
    case -6: 
      stroke(0, 0, 255, 255 - e*2);
      break;
    case -1001: 
      stroke(160, 255, 255, 255 - e*4);
      break;
    case -9: 
      stroke(192, 255, 255, 255);
      break;
    }
    strokeWeight(3);
    rotate(r);
    beginShape();
    vertex(0, 4);
    vertex(0, -4);
    endShape();
    rotate(-r);
  }

  // When the laser runtime equals the laser lifespan, the laser dissipates into space
  void dissipate(int j) {
    // j is the index of this laser in pewpew
    e++;
    if (e == f) pewpew.remove(j);
  }
}