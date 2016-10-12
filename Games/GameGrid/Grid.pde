
// a 2d game grid made of cells
class Grid {

  Cell cells[][];
  
  // number of cells
  int w, h;
  
  // cell size in pixels
  int cellWidth;
  int cellHeight;
  
  Grid(int gridWidth, int gridHeight) {
      w = gridWidth;
      h = gridHeight;
      cells = new Cell[w][h];
      
      cellWidth = width/w;
      cellHeight = height/h;
      
      int x, y;
      for(int i = 0; i < w; ++i) {
          for(int j = 0; j < h; ++j) {
            x = i*cellWidth;
            y = j*cellHeight;
            cells[i][j] = new Cell(x, y, cellWidth, cellHeight);
          }
      }
  }
  
  void loadLevel(int level[][]) {
    
    // make sure the level is the right size before loading
    if(level.length != w) {
      println("Grid: cannot load level, wrong width");
      return;
    }
    else if(level[0].length != h) {
      println("Grid: cannot load level, wrong height");
      return;
    }
    
    // set cell type from the 2d level array
    for(int i = 0; i < w; ++i) {
      for(int j = 0; j < h; ++j) {
        cells[i][j].type = level[j][i];
      }
    }
  }
  
  void draw() {
    for(int i = 0; i < w; ++i) {
      for(int j = 0; j < h; ++j) {
        cells[i][j].draw();
      }
    }
  }
  
  void drawGrid() {
    for(int i = 0; i < w; ++i) {
      for(int j = 0; j < h; ++j) {
        cells[i][j].drawGrid();
      }
    }
  }
  
  // reset cells in the grid
  void reset() {
    for(int i = 0; i < w; ++i) {
      for(int j = 0; j < h; ++j) {
        cells[i][j].reset();
      }
    }
  }
}