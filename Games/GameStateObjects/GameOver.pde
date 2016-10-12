
// game over screen
class GameOver extends State {
  
  GameOver() {
    // nothing to create, so this is empty  
  }
  
  void draw() {
    background(0, 255, 0);
     
    fill(0);
    textAlign(CENTER, CENTER);
    text("game over: click to restart", width/2, height/2);
  }
  
};