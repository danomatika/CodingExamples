
// May our lord savior grant us the goddamn burst laser we need to get 500 points
class JesusChrist extends Object {
  JesusChrist(float x, float y, int c) {
    this.x = x;
    this.y = y;
    // Random trajectory
    this.a = random(0, 2*PI);
    // Velocity of 1
    this.v = 1;
    this.r = 0;
    this.w = 0;
    this.s = 8;
    // Powerup types:
    // -1. Basic Laser
    // -2. Twin Laser
    // -3. Tri Laser
    // -4. Explosion
    // -5. Burst Laser
    // -6. Railgun
    // -7. Seeker Missiles
    // -8. Shield
    // -9. Beam Laser
    // -10. Seeker Missile Barrage
    // -11. Rapid Fire
    this.c = c;
  }

  // Renders the powerup
  void show() {
    fill(0);
    stroke(160, 255, 255);
    strokeWeight(1);
    ellipse(0, 0, 16, 16);
    switch(c) {
    case -1:
      strokeWeight(2);
      stroke(0, 255, 255);
      line(0, 8, 0, -8);
      break;
    case -2:
      strokeWeight(2);
      stroke(32, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      break;
    case -3:
      strokeWeight(2);
      stroke(64, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, 6, -6);
      line(0, 6, 0, -6);
      break;
    case -4:
      stroke(128, 255, 255);
      line(0, 6, 0, -6);
      line(6, 0, -6, 0);
      line(-6, 6, 6, -6);
      line(-6, -6, 6, 6);
      break;
    case -5:
      strokeWeight(2);
      stroke(96, 255, 255);
      line(0, 6, -6, -6);
      line(0, 6, -3, -6);
      line(0, 6, 0, -6);
      line(0, 6, 3, -6);
      line(0, 6, 6, -6);
      break;
    case -6:
      strokeWeight(2);
      stroke(0, 0, 255);
      line(0, 8, 0, -8);
      break;
    case -7:
      strokeWeight(2);
      stroke(160, 255, 255);
      ellipse(0, 0, 2, 2);
      line(4, 0, 8, 0);
      line(-4, 0, -8, 0);
      line(0, 4, 0, 8);
      line(0, -4, 0, -8);
      break;
    case -8:
      stroke(150, 255, 255);
      ellipse(0, 0, 12, 12);
      stroke(140, 255, 255);
      ellipse(0, 0, 8, 8);
      break;
    case -9:
      stroke(192, 255, 255);
      line(2, 8, 2, -8);
      line(0, 8, 0, -8);
      line(-2, 8, -2, -8);
      break;
    case -10:
      stroke(180, 255, 255);
      line(4, 0, 10, 0);
      line(-4, 0, -10, 0);
      line(0, 4, 0, 10);
      line(0, -4, 0, -10);
      line(3, 3, 7, 7);
      line(3, -3, 7, -7);
      line(-3, 3, -7, 7);
      line(-3, -3, -7, -7);
      if (mercury.q != 0) {
        strokeWeight(2);
        stroke(0, 255, 255);
        line(10, 10, -10, -10);
        line(-10, 10, 10, -10);
      }
      break;
    case -11:
      stroke(0, 255, 255);
      line(0, 8, 0, 4);
      line(0, 8, 3, 3);
      line(0, 8, -3, 3);
      line(0, 2, 0, -2);
      line(0, 2, 3, -1);
      line(0, 2, -3, -1);
      line(0, -4, 0, -8);
      line(0, -4, 3, -7);
      line(0, -4, -3, -7);
      if (mercury.q != 0) {
        strokeWeight(2);
        stroke(0, 255, 255);
        line(10, 10, -10, -10);
        line(-10, 10, 10, -10);
      }
      break;
    }
  }

  void collision(SpaceShip thing, int i) {
    // Detects collision between powerup and the Mercury
    // i is the index of the powerup in helpme
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      helpme.remove(i);

      // Enables the weapon of the corresponding powerup
      switch(c) {
      case -2: 
        bigFuckingGuns[2] = true;
        break;
      case -3: 
        bigFuckingGuns[3] = true;
        break;
      case -4:
        for (i = 0; i < 64; i++) {
          pewpew.add(new Laser(thing.x, thing.y, PI/2+i*PI/32, 24, i*PI/32, -4, 30));
        }
        break;
      case -5: 
        bigFuckingGuns[4] = true;
        break;
      case -6: 
        bigFuckingGuns[5] = true;
        break;
      case -7: 
        bigFuckingGuns[6] = true;
        break;
      case -8: 
        thing.l = 2;
        break;
      case -9: 
        bigFuckingGuns[7] = true;
        break;
      case -10: 
        bigFuckingGuns[8] = true;
        break;
      case -11: 
        bigFuckingGuns[9] = true;
        break;
      }
    }
  }
}