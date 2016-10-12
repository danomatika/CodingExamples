
// player character which moves about the game grid
class Player {
  
   // position on the grid, *not* pixels
   int x, y;
   
   // a reference to the game grid for sizing 
   // and collision detection
   Grid grid;
   
   // create with grid & grid position
   Player(Grid gameGrid, int gridX, int gridY) {
     grid = gameGrid;
     x = gridX;
     y = gridY;
   }
   
   void draw() {
     noStroke();
     fill(255, 0, 0);
     
     // grab the current cell we are on to get
     // it's pixel position & size
     Cell c = grid.cells[x][y];
     rect(c.x, c.y, c.w, c.h);
     
     // check if we area at the finish cell
     if(c.isFinish()) {
       
       // set global running boolean to false,
       // the game is over
       running = false;  
     }
     else if(c.isVitamin() && c.pickedUp == false) { // or a vitamin
     
       // increase global points
       points++;
       
       // we picked up this vitamin
       c.pickedUp = true;
     }
   }
   
   // check if we can move to a
   // cell at a given grid position
   boolean canMoveTo(int gridX, int gridY) {
     Cell c = grid.cells[gridX][gridY];
     if(c.isWall() == false) {
       return true;
     }
     return false;
   }
   
   // change grid positions,
   // make sure to stay on the grid &
   // check if there is a wall in the way
   void moveUp() {
     if(y > 0) {
       if(canMoveTo(x, y-1)) {
         y--;
       }
     }
   }
   
   void moveDown() {
     if(y < grid.h-1) {
       if(canMoveTo(x, y+1)) {
         y++;
       }
     }
   }
   
   void moveLeft() {
     if(x > 0) {
       if(canMoveTo(x-1, y)) {
         x--;
       }
     }
   }
   
   void moveRight() {
     if(x < grid.w-1) {
       if(canMoveTo(x+1, y)) {
         x++;
       }
     }
   }
  
}