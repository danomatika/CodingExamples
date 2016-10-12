// CellClick
//
// Abstract the window into a 2d
// grid of clickable cells.
//
// Dan Wilcox danomatika.com 2016

// grid size in cells
int gridWidth = 10;
int gridHeight = 10;

// size of each grid cell in pixels
int cellWidth;
int cellHeight;

// 2 dimensional array that holds grid values,
// this is abstract storage that be used for any type
// of visualzation, the meaning of the values can be up to you
int grid[][];

void setup() {
  size(400, 400);
  
  // calculate the cell size based on the grid size and the window size
  cellWidth = width/gridWidth;
  cellHeight = height/gridHeight;
  
  // create the grid array & init the value at all positions to 0
  grid = new int[gridWidth][gridHeight];
  for(int y = 0; y < gridHeight; ++y) {
    for(int x = 0; x < gridWidth; ++x) {
      grid[y][x] = 0; // init to 0
    }
  }
  
  // no line please
  noStroke();
}

void draw() {
  
  // go through each grid pos and draw a rectangle whose
  // color is based on the current value at that pos
  for(int y = 0; y < gridHeight; ++y) {
    for(int x = 0; x < gridWidth; ++x) {
      int value = grid[y][x];
      if(value == 0) {
        fill(255);
      }
      else if(value == 1) {
        fill(0, 200, 0);  
      }
      else if(value == 2) {
        fill(0, 0, 200);  
      }
      else if(value == 3) {
        fill(200, 200, 0);  
      }
      else { // everything else
        fill(200, 0, 0);  
      }
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);  
    }
  }
}

void mousePressed() {
  
  // convert mouse pos into the lower resolution grid pos
  int x = mouseX / cellWidth;
  int y = mouseY / cellHeight;
  
  // call function to udpate the grid pos
  clickGridPos(x, y);
  
  // print the 
  println("clicked on "+(mouseX / cellWidth)+ " "+(mouseY / cellHeight));
}

// click on a grid pos
void clickGridPos(int x, int y) {
  
  // make something happen when the grid pos has a certain value
  if(grid[y][x] == 1) {
    println("hello world");  
  }
  
  // increase value at the grid pos
  grid[y][x] += 1;
}