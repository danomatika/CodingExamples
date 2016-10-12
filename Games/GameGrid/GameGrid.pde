// GameGrid
//
// A 2d game grid with level loading.
//
// Dan Wilcox danomatika.com 2016

Grid grid;
Player player;

// cell type:
// 0 - nothing
// 1 - wall
// 2 - finish
// 3 - vitamin
int[][] level = {
  {0, 0, 1, 3, 0, 1, 1, 1, 1, 2},
  {0, 0, 1, 0, 0, 0, 0, 3, 1, 0},
  {0, 0, 1, 1, 1, 0, 1, 1, 1, 0},
  {3, 0, 0, 0, 0, 0, 1, 0, 0, 0},
  {1, 1, 1, 0, 3, 0, 1, 0, 3, 1},
  {0, 0, 1, 0, 0, 0, 1, 0, 0, 1},
  {3, 0, 1, 0, 1, 0, 0, 0, 0, 1},
  {0, 0, 0, 0, 1, 0, 0, 1, 1, 1},
  {1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  {3, 0, 0, 0, 0, 3, 0, 0, 0, 3}
};

// is the game running?
boolean running = false;

// how many points does the player have?
int points = 0;

// show debug view (draws the grid)
boolean debug = false;

void setup() {
  size(400, 400);
  
  grid = new Grid(10, 10);
  grid.loadLevel(level);
  
  player = new Player(grid, 0, 0);
}

void draw() {
  background(200);
  
  // run the game
  if(running == true) {
    grid.draw();
    player.draw();
    
    if(debug) {
      grid.drawGrid();  
    }
    
    // draw points
    fill(0);
    textAlign(LEFT);
    text("Points: "+points, 10, 20);
  }
  else { // game is over
    fill(0);
    textAlign(CENTER);
    text("Click the mouse\nto start the game.", width/2, height/2);
  }
}

void keyPressed() {
  if(key == 'd') {
    // toggle debug
    debug = !debug;
  }
  else if(key == CODED) {
    if(keyCode == UP) {
      player.moveUp();
    }
    else if(keyCode == DOWN) {
      player.moveDown();
    }
    else if(keyCode == LEFT) {
      player.moveLeft();
    }
    else if(keyCode == RIGHT) {
      player.moveRight();
    }
  }
}

void mousePressed() {
  // restart the game
  if(running == false) {
    reset(); 
  }
}

// reset the game
void reset() {
  player.x = 0;
  player.y = 0;
  grid.reset();
  points = 0;
  running = true; 
}