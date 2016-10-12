
// You must be at least 17 to acquire a space ship license
class SpaceShip extends Object {

  // d is weapon cooldown
  // f is weapon fire rate
  // l is shield points
  // p is special weapon type
  // q is special cooldown
  // t is weapon firerate final
  int d, f, l, p, q, t;

  SpaceShip() {
    this.launch();
  }

  // Renders the spaceship and its shield
  void show() {
    fill(0);
    stroke(75, 255, 255);
    strokeWeight(1);
    rotate(r);
    beginShape();
    vertex(0, 16);
    vertex(8, -16);
    vertex(-8, -16);
    vertex(0, 16);
    endShape();
    stroke(150, 255, 255, l*64);
    fill(150, 255, 255, l*24);
    ellipse(0, 0, 48, 48);
    rotate(-r);
  }

  // Ready for takeoff
  void launch() {
    loop();
    this.x = width/2;
    this.y = height/2;
    this.a = 0;
    this.v = 0;
    this.r = 0;
    this.w = 0;
    this.s = 12;
    // The space ship classes are the same as the powerup classes
    this.c = -1;
    this.f = 6;
    this.l = 1;
    this.p = 0; 
    this.q = 0;
    this.t = 6;

    // Clears space
    rocks.clear();
    pewpew.clear();
    helpme.clear();
    score = 0;

    // Clears Controls
    keyup = false;
    keyright = false;
    keyleft = false;
    keyshoot = false;

    // Generates 4 starting asteroids
    rocks.add(new Asteroid(random(0, width), 0, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(random(0, width), height, random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(0, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));
    rocks.add(new Asteroid(width, random(0, height), random(-PI, PI), random(0.4, 0.8), random(-PI/100, PI/100), 32, 0));

    // Resets weapons
    for (int i = 0; i < 10; i++) {
      bigFuckingGuns[i] = false;
    }

    // Enables the starting weapon
    bigFuckingGuns[1] = true;
  }

  // Accelerates the ship in the direction it's facing
  void accelerate() {
    float xt = cos(a)*v+cos(r+PI/2)*.2;
    float yt = sin(a)*v+sin(r+PI/2)*.2;
    v=sqrt(sq(yt)+sq(xt));
    a=atan2(yt, xt);
  }

  // Exacts freedom on the asteroids
  void shoot() {
    if (d == 0) {
      switch(c) {
      case -1:
        accuracy[1]++;
        pewpew.add(new Laser(x, y, r+PI/2+random(-PI/32, PI/32), 10, r+random(-PI/32, PI/32), -1, 60));
        break;
      case -2:
        accuracy[3]+=2;
        pewpew.add(new Laser(x, y, r+PI/2-PI/16+random(-PI/16, PI/16), 12, r-PI/16+random(-PI/16, PI/16), -2, 30));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16+random(-PI/16, PI/16), 12, r+PI/16+random(-PI/16, PI/16), -2, 30));
        break;
      case -3:
        accuracy[5]+=3;
        pewpew.add(new Laser(x, y, r+PI/2-PI/32, 18, r-PI/32, -3, 60));
        pewpew.add(new Laser(x, y, r+PI/2, 18, r, -3, 60));
        pewpew.add(new Laser(x, y, r+PI/2+PI/32, 18, r+PI/32, -3, 60));
        break;
      case -5:
        accuracy[7]+=4;
        pewpew.add(new Laser(x, y, r+PI/2-PI/8, 8, r-PI/8, -5, 10));
        pewpew.add(new Laser(x, y, r+PI/2-PI/16, 8, r-PI/16, -5, 10));
        pewpew.add(new Laser(x, y, r+PI/2, 8, r, -5, 10));
        pewpew.add(new Laser(x, y, r+PI/2+PI/16, 8, r+PI/16, -5, 10));
        pewpew.add(new Laser(x, y, r+PI/2+PI/8, 8, r+PI/8, -5, 10));
        break;
      case -6:
        accuracy[9]++;
        pewpew.add(new Laser(x, y, r+PI/2, 24, r, -6, 90));
        break;
      case -7:
        accuracy[11]++;
        pewpew.add(new Laser(x, y, r+PI/2, 16, r, -1001, 45));
        break;
      case -9:
        accuracy[13]++;
        for (int i = 1; i < 16; i++) {
          pewpew.add(new Laser(x+cos(r+PI/2)*16*i, y+sin(r+PI/2)*16*i, r+PI/2+PI/16, 16, r, -9, 3));
          pewpew.add(new Laser(x+cos(r+PI/2)*16*i, y+sin(r+PI/2)*16*i, r+PI/2-PI/16, 16, r, -9, 3));
        }
        break;
      }
      // Sets the cooldown to the fire rate
      d = f;
    }
  }

  // Activates the special weapon
  void wreckShit() {
    if (q == 0) {
      switch(p) {
      case 1: 
        for (int i = 0; i < 16; i++) {
          accuracy[11]+=16;
          pewpew.add(new Laser(x+64*cos(i*PI/8), y+64*sin(i*PI/8), 0, 8, 0, -1001, 45));
        }
        break;
      case 2: 
        f = 3;
        break;
      }

      // Sets the special cooldown to 3 seconds
      q = 90;
    }
  }
}