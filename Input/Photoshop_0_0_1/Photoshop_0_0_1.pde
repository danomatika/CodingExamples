// Photoshop 0.0.1
//
// A simple interactive drawing program template,
// extend this by adding your own drawing modes, colors, etc
//
// Hint: an "eraser" can be made by drawing over things using
// the current background color ...
//
// Hint 2: random() + noise() could be fun here as well ...
//
// Dan Wilcox danomatika.com 2015

/* GLOBAL VARIABLES */

color bgColor = color(255); // white
color drawColor = color(0); // black

// drawing state
// 0: pen
// 1: pattern
// add more here ...
int drawMode = 0;

/* BUILT IN FUNCTIONS */

// called once at the beginning
void setup() {
  size(480, 640); // change size/aspect?
  background(bgColor);
}

// called on every frame
void draw() {
  
  // draw only when the left mouse button is pressed
  if(mousePressed == true && mouseButton == LEFT) {
    if(drawMode == 0) { // pen draw mode
      noFill();
      stroke(drawColor);
      strokeWeight(4);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else if(drawMode == 1) { // pattern draw mode
      noStroke();
      fill(drawColor);
      drawPattern(mouseX, mouseY);
    }
    // add some more draw modes here?  
  }
  
}

// called whenever a key is pressed
void keyPressed() {
  
  // number keys: change color
  if(key == '1') {
    drawColor = color(0, 0, 0); // black
  }
  if(key == '2') {
    drawColor = color(255, 0, 0); // red
  }
  else if(key == '3') {
    drawColor = color(0, 255, 0); // green
  }
  else if(key == '4') {
    drawColor = color(0, 0, 255); // blue
  }
  
  // spacebar: clear background
  else if(key == ' ') {
    background(bgColor);  
  }
  
  // change draw mode
  else if(key == 'q') { // pen
    drawMode = 0;
  }
  else if(key == 'w') { // pattern
    drawMode = 1;
  }
  
  // save the current drawing to the sketch folder
  else if(key == 's') {
    saveDrawing();
  }
}

// called whenever a mouse button is pressed
void mousePressed() {
  if(mouseButton == RIGHT) {
    // right mouse button pressed
    // maybe change a mode here?  
  }
}

/* MY CUSTOM FUNCTIONS */

// draws a custom pattern,
// in this case a simple star using beginShape
void drawPattern(int x, int y) {
  beginShape();
  vertex(x, y-14);
  vertex(x+10, y+10);
  vertex(x-10, y-8);
  vertex(x+10, y-8);
  vertex(x-10, y+10);
  endShape();
}

// saves the current drawing to a png file to your sketch folder,
// open from the menu with: Sketch->Show Sketch Folder
void saveDrawing() {
  
  // create a text string using the current calendar date & time
  // to make sure each file has a unique name so it doesn't get overwritten
  String timestamp = year()+"-"+month()+"-"+day()+"_"+hour()+minute()+second();
  
  // save inside "drawings" subfolder
  save("drawings"+"/drawing_"+timestamp+".png");
}