
// There's a lot of empty space up here
abstract class Object {

  // x and y are the positions of the object
  // a is the angle of the velocity
  // v is the velocity of the object
  // r is the rotation of the object
  //   r and a are different because an object may be 
  //   facing in a different direction from where it's moving
  // w is the rotation rate of the object
  // s is the size of the object
  float x, y, a, v, r, w, s;
  // c is the type of the object
  int c;

  // The gears and machinery that runs the entire program
  // Tick controls movement and rotation of objects
  void tick() {
    // If an object goes offscreen, it appears on the other side

    // Static Space
    if (options[0] == 1) {
      if (x<0) {
        x += width;
        y = height-y;
      }
      if (x>width) {
        x -= width;
        y = height-y;
      }
      if (y<0) {
        y += height;
        x = width-x;
      }
      if (y>height) {
        y -= height;
        x = width-x;
      }
    }

    // Mercury centered and static Mercury
    if (options[0] == 3 || options[0] == 2) {
      if (x<0) {
        x += width;
      }
      if (x>width) {
        x -= width;
      }
      if (y<0) {
        y += height;
      }
      if (y>height) {
        y -= height;
      }
    }

    // Changes the position and rotation of the ship
    r += w;
    // Newtonian integration works here
    x += cos(a)*v;
    y += sin(a)*v;

    // Does the tracking
    switch(c) {
      // Seeker Asteroid tracking
    case 1: 
      if (abs(atan2(mercury.y-y, mercury.x-x) - a) < PI) {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a += 0.04;
        }
        else {
          a -= 0.04;
        }
      }
      else {
        if (atan2(mercury.y-y, mercury.x-x) > a) {
          a -= 0.04;
        }
        else {
          a += 0.04;
        }
      }
      if (a < -PI) {
        a = PI+a;
      }
      if (a > PI) {
        a = -PI+a;
      }
      // Has weird edge cases and shit. I hate this code...
      break;

      // Seeker Missile tracking
    case -1001: 
      r = a - PI/2;
      Asteroid track = rocks.get(0);
      for (int i = 1; i < rocks.size(); i++) {
        // Sets the tracked asteroid to the asteroid closest to the laser
        Asteroid rock = rocks.get(i);
        if (dist(x, y, rock.x, rock.y) < dist(x, y, track.x, track.y)) {
          track = rock;
        }
      }
      // Much simpler than Seeker Asteroid
      a = atan2(track.y-y, track.x-x);
      break;
    }
  }

  // All objects have a show method
  void show() {
  }

  // Displays the asteroid on the screen
  void display() {
    translate(x, y);
    show();
    translate(-x, -y);

    // Static Mercury and Mercury Centered
    if (options[0] == 3 || options[0] == 2) {
      translate(x+width, y);
      show();
      translate(-x-width, -y);

      translate(x-width, y);
      show();
      translate(-x+width, -y);

      translate(x, y+height);
      show();
      translate(-x, -y-height);

      translate(x, y-height);
      show();
      translate(-x, -y+height);

      translate(x+width, y+height);
      show();
      translate(-x-width, -y-height);

      translate(x-width, y-height);
      show();
      translate(-x+width, -y+height);

      translate(x+width, y-height);
      show();
      translate(-x-width, -y+height);

      translate(x-width, y+height);
      show();
      translate(-x+width, -y-height);
    }

    // Static Space
    if (options[0] == 1) {
      translate(x+width, height-y);
      show();
      translate(-x-width, y-height);

      translate(x-width, height-y);
      show();
      translate(-x+width, y-height);

      translate(width-x, y+height);
      show();
      translate(x-width, -y-height);

      translate(width-x, y-height);
      show();
      translate(x-width, -y+height);
    }
  }
}