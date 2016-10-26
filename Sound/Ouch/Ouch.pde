// Ouch
//
// Play a sound file when a button is pressed.
//
// Install sound via the menu:
// Sketch->Import Library...->Add library...
//
// Dan Wilcox 2016

// requires the Processing sound library
import processing.sound.*;

SoundFile ouch; // sound file to play
boolean isOver = false; // is the mouse over the circle

void setup() {
  size(400, 400);
  background(255);
  
  // always needs this as firt parameter
  ouch = new SoundFile(this, "ouch.wav");
  //ouch.rate(2.0); // twice as fast
  //ouch.amp(0.5); // half as loud
  //ouch.pan(0); // requires mono file (1 channel)
  //ouch.loop(); // beware!

  noStroke();
}

void draw() {
  
  // rollover check using distance
  float d = dist(mouseX, mouseY, width/2, height/2);
  if(d < 50) {
     fill(255, 200, 200); // red
     isOver = true;
  }
  else {
    fill(200, 200, 100);  // yellow
    isOver = false;
    //ouch.stop();
  }
  ellipse(width/2, height/2, 100, 100);
  
}

// play when mouse was pressed
void mousePressed() {
  if(isOver) {
    ouch.play(); // play
  }
}