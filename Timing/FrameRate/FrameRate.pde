// FrameRate
//
// Change the framerate live using the up and down arrow keys.
//
// Dan Wilcox danomatika.com 2016

// the currently desired frame rate
int desiredFPS = 30;

void setup() {
  size(400, 400);
  
  // set the *desired* frame rate in fps, not guaranteed!
  frameRate(desiredFPS);
}

void draw() {
  
  // random background every frame
  background(random(255), random(255), random(255));
  
  // draw the frame rate as text
  fill(255);
  text(frameRate+" fps", 10, 20);

  // change frame rate with UP & DOWN arrow keys
  if(keyPressed) {
    
    // is this a special key? (arrow, shift, etc)
    if(key == CODED) {
      
      // check which special key
      if(keyCode == UP) {
        desiredFPS++; // increase by 1
        if(desiredFPS > 100) {
          desiredFPS = 100; // keep within upper limit 
        }
        frameRate(desiredFPS);
      }
      else if(keyCode == DOWN) {
        desiredFPS--; // decrease by 1
        if(desiredFPS < 1) {
          desiredFPS = 1; // keep within lower limit
        }
        frameRate(desiredFPS);
      }
    }
  }
}