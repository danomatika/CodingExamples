// ForLoop
//
// Do something and do it again,
// includes position-based logic.
//
// Dan Wilcox danomatika.com 2016

size(400, 400);

// current position
int x;
int y;

// number of objects
int numObjects = 1000;

// size of objects
int objectSize = 15;

background(255);
noStroke();
rectMode(CENTER);

// do things multiple times -> iteration

// for loop
//
// for(init; comparison; update)
// init: the counting variable
// comparison: keep doing the loop if true
// update: update the var at the end of each loop

// draw multiple objects
for(int i = 0; i < numObjects; ++i) { // i is our counter var

  x = int(random(width)); // convert float to int
  y = int(random(height));
  
  // choose random fill
  fill(random(255), // red 0 -255
       random(255), // green
       random(255), // blue
       200);        // alpha
       
  // draw rectangles on one half of the screen
  if(x < width/2) {
    rect(x, y, objectSize, objectSize);  
  }
  else { // or circles on the other
    ellipse(x, y, objectSize, objectSize);
  }
  
}