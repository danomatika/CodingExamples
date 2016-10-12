
// the start screen
class GameStart extends State {
  
  GameStart() {
    // nothing to create, so this is empty
  }
  
  void draw() {
    background(255, 0, 0);
     
    fill(0);
    textAlign(CENTER, CENTER);
    text("start: click to begin", width/2, height/2);
  }
};