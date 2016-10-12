// GameState
//
// This example demonstrates simple game state control
// using a variable, in this case the state integer.
//
// Dan Wilcox danomatika.com 2016

// the current state:
// 0 - start, 1 - game, 2 - game over
int state = 0;

// game ball
Ball ball;

void setup() {
  size(400, 400);
  
  // create the game ball
  ball = new Ball();
}

void draw() {
   if(state == 0) {
     // start screen
     background(255, 0, 0);
     
     fill(0);
     textAlign(CENTER, CENTER);
     text("start: click to begin", width/2, height/2);
   }
   else if(state == 1) {
     // game
     background(255, 255, 0);
     
     fill(0);
     textAlign(CENTER, CENTER);
     text("zen game: wait for ball to bounce 4 times: "+ball.bounces, width/2, height/2);
     
     ball.update();
     if(ball.awake) {
       ball.draw();
     }
     else {
       // game over! go to game over screen
       state = 2;
     }
   }
   else if(state == 2) {
     // game over
     background(0, 255, 0);
     
     fill(0);
     textAlign(CENTER, CENTER);
     text("game over: click to restart", width/2, height/2);
   }
}

void mousePressed() {
  if(state == 0) {
    // start screen
    state = 1; // go to game
    ball.reset(); // reset the ball for the game
  }
  else if(state == 2) {
    // game over
    state = 0; // go to start screen
  }
}