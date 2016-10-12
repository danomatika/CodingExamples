
// circle particle
class Circle {
 
  // where it is
  PVector pos;
  
  // is the circle alive?
  boolean alive = true;
  
  // timstamp for when the circle was "born"
  long birthtime = 0;
  
  // how long the particle should live
  long lifetime;
  
  // life color
  color aliveColor = color(255);

  // constuctor with a random pos
  Circle() {
    pos = new PVector(random(width), random(height));
    reset();
  }
  
  // constructor with a given pos
  Circle(int x, int y) {
    pos = new PVector(x, y);
    reset();
  }
  
  // reset circle life & generate new life time colors
  void reset() {
    birthtime = millis();
    lifetime = int(random(1000, 5000));
    aliveColor = color(100 + random(155), 
                       100 + random(155),
                       100 + random(155));
  }
  
  // check if the circle has lived long enough
  void update() {
    if(millis() - birthtime > lifetime) {
      alive = false; // it dies :(
    }
  }
  
  void draw() {
    
    // "age" is the amount of time the circle has been alive
    // aka the time difference between when it was born and now
    long age = millis() - birthtime;
    
    // compute color alpha based on the age where:
    // born: full alpha
    // half life: half alpha
    // dead: no alpha
    float alpha = map(age, 0, lifetime, 255, 0);
    fill(red(aliveColor), green(aliveColor), blue(aliveColor), alpha);
    println(alpha);
    
    // draw
    noStroke();
    ellipse(pos.x, pos.y, 50, 50);
  }
}