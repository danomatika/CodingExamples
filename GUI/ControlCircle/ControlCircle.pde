// ControlCircle
//
// Control draw properties of a circle
// using the controlP5 library. Install
// controlP5 via the the following menu item:
// Sketch->Import Library...->Add library...
//
// Dan Wilcox danomatika.com 2016

import controlP5.*;

// main controlP5 object which manages all the widgets
ControlP5 cp5;

float x, y;
float diameter;
color fillColor;

void setup() {
  size(400, 400);

  // init the variables
  x = width/2;
  y = height/2;
  diameter = 100;
  fillColor = color(220, 120, 120);

  // create the main controlP5 object,
  // note that it takes "this" as it's creation
  // paramater -> "this" refers to this Processing sketch
  cp5 = new ControlP5(this);
  
  // create a slider that automatically updates the "diameter" variable
  cp5.addSlider("diameter")
     .setPosition(10, 10) // upper left corner
     .setSize(200, 20)
     .setRange(0, 255) // 10, 400
     .setValue(diameter)
     ;
     
  // create a color picker that calls the function "picker"
  ColorPicker cp = cp5.addColorPicker("fillColor");
  cp.setPosition(10, 30);
  cp.setColorValue(fillColor);
}

// this function gets called when the color picker
// named "fillColor" is changed
void fillColor(color c) {
  fillColor = c;
}

void draw() {
  background(100);
  
  noStroke();
  fill(fillColor);
  ellipse(x, y, diameter, diameter);
}