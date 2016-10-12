// Overlap
//
// A simple game using distance between 2 points.
//
// Move the circle using the mouse and try to avoid the second circle.
//
// Dan Wilcox danomatika.com 2016

float x1, y1; // moving circle pos
float x2, y2; // mouse circle pos

// moving circle velocity
float velX;
float velY;

// how big?
float circleSize = 100;

// should the moving circle move?
boolean shouldMove = true;

void setup() {
  size(400, 400);
  
  velX = random(6, 10);
  velY = random(-6, 10);
  
  x1 = width/2;
  y1 = height/2;
  
  noCursor();
}

void draw() {
  background(100);
  
  // update?
  if(shouldMove) {
    
    // update the pos using the velocity
    x1 = x1 + velX;
    y1 = y1 + velY;
    
    // check boundaries
    if(x1 < 0 || x1 > width) {
      velX = velX * -1; // turn around  
    }
    if(y1 < 0 || y1 > height) {
      velY = velY * -1;  
    }
    
    // update the mouse circle with the current mouse pos
    x2 = mouseX;
    y2 = mouseY;
  }
  
  // how far apart are the circles?
  float d = dist(x1, y1, x2, y2);
  
  // check for overlaps, if the distance between the circles
  // is less than the sum of the radii, there is an overlap
  if(d < circleSize) {
    fill(220, 220, 120); // gold 
    shouldMove = false;
  }
  else {
    fill(255); // white 
  }
  
  // moving circle
  noStroke();
  ellipse(x1, y1, circleSize, circleSize);
  
  // mouse circle
  fill(220, 120, 220);
  ellipse(x2, y2, circleSize, circleSize);

  // draw the loser text
  if(!shouldMove) {
    fill(255, 0, 0);
    textAlign(CENTER);
    text("You Lose", width/2, height/2);   
  }

  // reset the game
  if(mousePressed) {
    shouldMove = true;
    x1 = random(width);
    y1 = random(height);
    velX = random(-4, 4);
    velY = random(-4, 4);
  }
}