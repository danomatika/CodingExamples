// NestedForLoops
//
// Draw a 2D grid using nested for loops.
// Choose a random fill for each row or col.
//
// Dan Wilcox danomatika.com 2015

size(400, 400);

// rectangle size
int rectSize = 20;

// for(init; comparison; update)
// init: setup the counting variable
// comparison: keep doing the loop if true
// update: update the var at the end of each loop

// two ways to draw: by row or by column

// draw row by row
for(int y = rectSize/2; y < height; y = y + rectSize*2) { 
  
  fill(random(255), random(255), random(255)); 
  
  // draw each row
  for(int x = rectSize/2; x < width; x = x + rectSize*2) {
    rect(x, y, rectSize, rectSize);
  }
}

//// draw column by column
//for(int x = rectSize/2; x < width; x = x + rectSize*2) { 
//  
//  fill(random(255), random(255), random(255)); 
//  
//  // draw each row
//  for(int y = rectSize/2; y < height; y = y + rectSize*2) {
//    rect(x, y, rectSize, rectSize);
//  }
//}