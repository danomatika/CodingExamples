// Game State Objects
//
// This example demonstrates more advanced game state control
// using state classes and a current state variable.
//
// Dan Wilcox danomatika.com 2016

GameStart start; // start screen instance
Game game; // game instance
GameOver over; // game over screen instance

// the current state
// this just points to either start, game, or gameover
State state;

void setup() {
  size(400, 400);
  
  start = new GameStart();
  game = new Game();
  over = new GameOver();
  
  // set the current state to the start screen
  state = start;
}

void draw() {
  
  // check if the game is currently running and is done
  if(state == game && state.done) {
    // if done, then go to the game over screen
    state = over;
  }
  
  // draw the current state
  state.draw();
}

void mousePressed() {
  if(state == start) {
    // start screen
    state = game; // go to game
    state.setup(); // setup the game
  }
  else if(state == over) {
    // game over
    state = start; // go to start screen
  }
}