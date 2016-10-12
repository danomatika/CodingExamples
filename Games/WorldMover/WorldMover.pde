// WorldMover
//
// Move the world under an object instead of an object on the world.
//
// Use the arrow keys to steer the rectangle.
//
// Dan Wilcox danomatika.com 2016

// player
PVector pos;
PVector vel;
float angle = 0; // which direction it's facing

// world
int worldWidth = 800;
int worldHeight = 800;
int halfWorldWidth = worldWidth/2;
int halfWorldHeight = worldHeight/2;
float bounds = 50; // how far inside or outside the world things can go

// arrow key states
boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;

void setup() {
    size(400, 400);
    pos = new PVector(0, 0); // 0 0 is the middle of the screen
    vel = new PVector(0, 5); // start facing up
}

void draw() {
  background(0);
  
  // update position & direction
  if(left) { // turn left
    angle -= PI/80;
    vel.rotate(-PI/80);
  }
  if(right) { // turn right
    angle += PI/80;
    vel.rotate(PI/80);
  }
  if(up) { // forward
    pos.add(vel);
  }
  else if(down) { // or back
    pos.sub(vel);
  }
  
  // stay in bounds
  if(pos.x < -halfWorldWidth+bounds) {
    pos.x = -halfWorldWidth+bounds;
  }
  else if(pos.x > halfWorldWidth-bounds) {
    pos.x = halfWorldWidth-bounds;  
  }
  if(pos.y < -halfWorldHeight+bounds) {
    pos.y = -halfWorldHeight+bounds;
  }
  else if(pos.y > halfWorldHeight-bounds) {
    pos.y = halfWorldHeight-bounds;  
  }
  
  pushMatrix();
  
    // move origin to the middle of the screen
    translate(width/2, height/2);
    
    // draw the world
    pushMatrix();
      
      // move the world based on the player position
      translate(pos.x-halfWorldWidth, pos.y-halfWorldHeight);
      
      // draw world as a simple grid
      rectMode(CORNER);
      noStroke();
      fill(100);
      rect(0, 0, halfWorldWidth, halfWorldHeight);
      fill(220);
      rect(halfWorldWidth, 0, halfWorldWidth, halfWorldHeight);
      fill(120);
      rect(0, halfWorldWidth, halfWorldWidth, halfWorldHeight);
      fill(180);
      rect(halfWorldWidth, halfWorldHeight, halfWorldWidth, halfWorldHeight);
      
      // draw outline of player boundaries
      rectMode(CENTER);
      noFill();
      stroke(220, 220, 120);
      rect(halfWorldWidth, halfWorldHeight, worldWidth-bounds*2, worldHeight-bounds*2);
    
    popMatrix(); // done with world
    
    // draw player
    // always located in the middle of the screen
    pushMatrix();
    
      // rotate to match the current direction
      rotate(angle);
      
      // draw the boundary for edge detection on the player
      stroke(120, 220, 120);
      ellipse(0, 0, bounds*2, bounds*2);
      
      // draw player as a rect
      noStroke();
      fill(220, 120, 120);
      rectMode(CENTER);
      rect(0, 0, 50, 100);
      
      // draw a whisker to denote the current direction the player is facing
      stroke(120, 120, 220);
      strokeWeight(4);
      line(0, -10, 0, -55);
      strokeWeight(1);
      
    popMatrix(); // done with player
    
  popMatrix(); // done overall

  // draw the player position
  fill(255);
  text("pos: "+int(pos.x)+" "+int(pos.y), 10, 20);
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      left = true;
    }
    else if(keyCode == RIGHT) {
      right = true;  
    }
    else if(keyCode == UP) {
      up = true;
    }
    else if(keyCode == DOWN) {
      down = true;
    }
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      left = false;
    }
    else if(keyCode == RIGHT) {
      right = false;  
    }
    else if(keyCode == UP) {
      up = false;
    }
    else if(keyCode == DOWN) {
      down = false;
    }
  }
}