// SinMouth
//
// A set of rectangles bite the middle of the window
// (in the style of Zach Lieberman).
//
// Click the mouse to eat the food.
//
// Dan Wilcox danomatika.com 2016

// top position
float topX, topY;

// bottom position
float bottomX, bottomY;

// where the top is anchored to
float topAnchorY;

// where the bottom is anchored to
float bottomAnchorY;

// how much to move
float offsetY;

// animation variable along the sin curve
float angleY = 0.0;

// has the "food" been eaten
boolean eaten = false;

void setup() {
  size(400, 400); 
  
  rectMode(CENTER);
  
  topX = width/2;
  bottomX = height/2;

  topAnchorY = -50;
  bottomAnchorY = height+50;
  
  offsetY = height/2+2;
}

void draw() {
  background(100, 220, 220);
  
  // calculate position using a rectified sin value
  topY = topAnchorY + abs(sin(angleY)) * offsetY;
  bottomY = bottomAnchorY - abs(sin(angleY)) * offsetY;
  
  // only update if below PI since we only want part of
  // the curve from 0 to PI aka from 0 to 1 to 0
  if(angleY < PI) {
    angleY = angleY + 0.025;
  }
  else {
    angleY = PI;
  }
  
  // the food is eaten once the mosue has closed completely
  if(angleY >= HALF_PI) {
    eaten = true;
  }
  
  // draw the food if it hasn't been eaten yet
  if(eaten == false) {
    fill(220, 120, 120);
    ellipse(width/2, height/2, 75, 75);
  }
  
  // top & bottom jaws
  noStroke();
  fill(220, 220, 20);
  rect(topX, topY, width, 100);
  rect(bottomX, bottomY, width, 100);

  // mustache
  fill(140, 140, 40);
  rect(topX, topY+20, width*0.5, 40);
  
  // eyes
  fill(255);
  ellipse(topX-75, topY-75, 50, 100);
  ellipse(topX+75, topY-75, 50, 100);
  
  // pupils
  fill(0);
  ellipse(topX-75, topY-75, 20, 40);
  ellipse(topX+75, topY-75, 20, 40);
  
  // reset
  if(mousePressed) {
    angleY = 0.0;
    eaten = false;
  }
}