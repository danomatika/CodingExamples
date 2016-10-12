
// I like rocks
class Asteroid extends Object {

  // The geometry of the asteroid
  float[] vertx = new float[16];
  float[] verty = new float[16];

  Asteroid(float x, float y, float a, float v, float w, float s, int c) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.v = v;
    this.r = 0;
    this.w = w;
    this.s = s;
    // Asteroid types:
    // 1. Standard
    // 2. Seeker
    // 3. Breeder
    this.c = c;

    // Sets the vertices of the asteroid to an random 16 sided polygon
    for (int i = 0; i < 16; i++) {
      // The vertices are generated radially
      // A vertice is generated at an angle of 0 with a random distance from the center of the asteroid
      // Then the next vertice is PI/8 radians rotated from the previous one and generated with a new random distance from the center
      // Ask Lambert, it's a lot easier to explain in person
      vertx[i] = sin(i*PI/8)*(s + random(-s/4, s/4));
      verty[i] = cos(i*PI/8)*(s + random(-s/4, s/4));
    }
  }

  void show() {
    // The color of the asteroid is determined by the type
    fill(0);
    switch(c) {
    case 0: 
      // White
      stroke(255);
      break;
    case 1: 
      // Yellow
      stroke(32, 255, 255);
      break;
    case 2: 
      // Purple
      stroke(192, 255, 255);
      break;
    case 3: 
      // Blue
      stroke(128, 255, 255);
      break;
    }

    // Renders the asteroid
    strokeWeight(1);
    rotate(r);
    // Places the vertices of the polygon
    beginShape();
    for (int i = 0; i < 16; i++) {
      vertex(vertx[i], verty[i]);
    }
    vertex(vertx[0], verty[0]);
    endShape();
    rotate(-r);
  }

  void collision(Object thing, int i, int j) {
    // i is the index of rocks for this asteroid
    // j is the index of pewpew for the laser

    // Detects collision
    if (dist(this.x, this.y, thing.x, thing.y) < this.s+thing.s) {
      // If a laser hits an asteroid, you add 1 to self esteem
      score++;

      // Updates accuracy
      switch(thing.c) {
      case -1:
        accuracy[0]++;
        break;
      case -2:
        accuracy[2]++;
        break;
      case -3:
        accuracy[4]++;
        break;
      case -5:
        accuracy[6]++;
        break;
      case -6:
        accuracy[8]++;
        break;
      case -1001:
        accuracy[10]++;
        break;
      case -9:
        accuracy[12]++;
        break;
      }

      // If the laser isn't a railgun, delete the laser
      if (thing.c != -6) {
        pewpew.remove(j);
      }

      // Random chance to drop a powerup when destroyed
      // Chance is 3/64
      if (random(0, 64) < 3) {
        helpme.add(new JesusChrist(x, y, ceil(random(-12, -2))));
      }

      // Adds new asteroids if size is above a threshold
      if (s>7) {

        // Adds different asteroids for different asteroid types
        switch(c) {
        case 0: 
          // For regular asteroids, divides size by 2 and multiplies velocity by 1.6
          rocks.add(new Asteroid(x, y, a-PI/8, 
          v*1.6, w*2, 
          s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/8, 
          v*1.6, w*2, 
          s/2, c));
          break;
        case 1: 
          // For seeker asteroids, divides size by 2 and multiplies velocity by 1.3
          rocks.add(new Asteroid(x, y, a-PI/4, 
          v*1.3, w*2, 
          s/2, c));
          rocks.add(new Asteroid(x, y, a+PI/4, 
          v*1.3, w*2, 
          s/2, c));
          break;
        case 2: 
          // For breeker asteroids, divides size by 3
          // Sends out 4 asteroids at right angles with a random velocity and size divided by 2
          rocks.add(new Asteroid(x, y, w, 
          random(1.2, 1.8), w*2, 
          s/2, 0));
          rocks.add(new Asteroid(x, y, w+PI/2, 
          random(1.2, 1.8), w*2, 
          s/2, 0));
          rocks.add(new Asteroid(x, y, w+PI, 
          random(1.2, 1.8), w*2, 
          s/2, 0));
          rocks.add(new Asteroid(x, y, w-PI/2, 
          random(1.2, 1.8), w*2, 
          s/2, 0));
          rocks.add(new Asteroid(x, y, 0, 0, 
          w*2, 
          s/3, c));
          break;
        }
      }

      // Adds more asteroids based on the score
      if (score%12 == 0) {
        // Every 12 points, adds a regular asteroid
        // 32 size and random velocity
        rocks.add(new Asteroid(
        mercury.x+random(128, width-128), 
        mercury.y+random(128, height-128), 
        random(-PI, PI), random(0.4, 0.8), 
        random(-PI/100, PI/100), 32, 0));
      }

      if (score%20 == 0) {
        // Every 20 points, adds a seeker asteroid
        // 24 size and random velocity
        rocks.add(new Asteroid(mercury.x+random(128, width-128), 
        mercury.y+random(128, height-128), 
        random(-PI, PI), random(0.6, 0.8), 
        random(-PI/100, PI/100), 24, 1));
      }

      if (score%42 == 0) {
        // Every 42 points, adds a breeder asteroid
        // 48 size and zero velocity
        rocks.add(new Asteroid(
        mercury.x+random(128, width-128), 
        mercury.y+random(128, height-128), 
        0, 0, random(-PI/50, PI/50), 48, 2));
      }

      // Removes the rock that was hit by a laser
      rocks.remove(i);
    }
  }
}