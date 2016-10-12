
// a single cell in the grid
class Cell {
  
  // position & size in pixels
  float x, y;
  float w, h;
  
  // cell type:
  // 0 - nothing
  // 1 - wall
  // 2 - finish
  // 3 - vitamin
  int type = 0;
  
  // if this is a vitamin, does it exist on the grid
  // or has it been picked up
  boolean pickedUp = false;
  
  Cell(float xPos, float yPos, float cellWidth, float cellHeight) {
    x = xPos;
    y = yPos;
    w = cellWidth;
    h = cellHeight;
  }
  
  void draw() {
    if(type == 0) { // nothing
      // nothing to draw
    }
    else if(type == 1) { // wall
      fill(255);
      rect(x, y, w, h);
    }
    else if(type == 2) { // finish
      fill(0, 255, 0);
      rect(x, y, w, h);
    }
    else if(type == 3 && pickedUp == false) { // vitamin
      fill(255, 255, 0);
      rect(x+h/4, y+h/4, w/2, h/2);
    }
  }
  
  // draw the grid as an overlay,
  // useful for debugging
  void drawGrid() {
    noFill();
    stroke(255, 100); // alpha
    rect(x, y, w, h);
  }
  
  // reset the cell
  void reset() {
    pickedUp = false; 
  }
  
  // type checks
  boolean isWall() {
    if(type == 1) {
      return true;
    }
    return false;
  }
  
  boolean isFinish() {
    if(type == 2) {
      return true;
    }
    return false;
  }
  
  boolean isVitamin() {
    if(type == 3) {
      return true;
    }
    return false;
  }
}