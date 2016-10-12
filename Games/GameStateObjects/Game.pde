
// the game itself
class Game extends State {
  
  // game variables
  Ball ball;
  
  Game() {
    // create the game ball
    ball = new Ball();  
  }
  
  void setup() {
    // reset the ball for the game
    ball.reset();
    
    // not done anymore - starting over,
    // this is declared in the base State class
    done = false;
  }
  
  void draw() {
    background(255, 255, 0);
     
    fill(0);
    textAlign(CENTER, CENTER);
    text("zen game: wait for ball to bounce 4 times: "+ball.bounces, width/2, height/2);
    
    ball.update();
    if(ball.awake) {
      ball.draw();
    }
    else {
      // game over!
      done = true;
    }
  }
  
}