
// a base game state class,
// kind of like a mini Sketch
class State {
  
  // set to true when this state is done &
  // we can go to the next state
  boolean done = false;
  
  // setup the state
  void setup() {
    // implement in subclass
  }
  
  // draw the state
  void draw() {
    // implement in subclass
  }
  
}