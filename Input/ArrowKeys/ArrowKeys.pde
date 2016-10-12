// ArrowKeys
//
// Move a circle using arrow key states.
//
// Dan Wilcox danomatika.com 2016

// circle position
float x, y;

// arrow key states
boolean leftDown = false;
boolean rightDown = false;
boolean upDown = false;
boolean downDown = false;

void setup() {
    size(400, 400);
    
    // start in the middle
    x = width/2;
    y = height/2;
}

void draw() {
  background(100);
  
  // update position
  if(leftDown) {
    x = x - 5;
  }
  if(rightDown) {
    x = x + 5;  
  }
  if(upDown) {
    y = y - 5;
  }
  if(downDown) {
    y = y + 5;
  }
  
  // draw
  noStroke();
  fill(120, 220, 220);
  ellipse(x, y, 100, 100);
}

// set the arrow key states when pressed
void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      leftDown = true;
    }
    else if(keyCode == RIGHT) {
      rightDown = true;  
    }
    else if(keyCode == UP) {
      upDown = true;
    }
    else if(keyCode == DOWN) {
      downDown = true;
    }
  }
}

// set the arrow key states when released
void keyReleased() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      leftDown = false;
    }
    else if(keyCode == RIGHT) {
      rightDown = false;  
    }
    else if(keyCode == UP) {
      upDown = false;
    }
    else if(keyCode == DOWN) {
      downDown = false;
    }
  }
}