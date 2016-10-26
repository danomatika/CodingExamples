// ControlCircle
//
// Control aspects of a circle animation
// using a controlP5 interface.
//
// Install controlP5 via the menu:
// Sketch->Import Library...->Add library...
//
// Dan Wilcox danomatika.com 2015

// requires the controlP5 library
import controlP5.*;

// gui instance
ControlP5 gui;

// colors
color red = color(229, 69, 69);
color green = color(47, 234, 120);
color circleColor = color(200);

// animation variables
float angle = 0;
float angleSpeed = 0.01;

void setup() {
  size(400, 400);
  
  // create GUI instance
  gui = new ControlP5(this);
 
  // add two buttons and a slider
  gui.addButton("one")
     .setPosition(10, 10)
     .setSize(40, 40);
  gui.addButton("two")
     .setPosition(width-50, 10)
     .setSize(40, 40);
  gui.addSlider("speed")
     .setPosition(10, height-50)
     .setSize(width-20, 40)
     .setRange(0.01, 0.1);

  // set slider default value
  gui.getController("speed").setValue(angleSpeed);
     
  // hide the slider's caption
  gui.getController("speed").getCaptionLabel().setVisible(false);
}

void draw() {
  background(100);
  
  // centered circle who's size depends on sin
  noStroke();
  fill(circleColor);
  float s = abs(sin(angle)) * 200;
  ellipse(width/2, height/2, s, s);
  angle = angle + angleSpeed;
}

// callback event function for when the 
// button called "one" is pressed
public void one() {
  println("one button pressed");
  circleColor = red;
}

// callback event function for when the 
// button called "two" is pressed
public void two() {
  println("two button pressed");
  circleColor = green;
}

// callback event function for when the 
// slider calld "speed" is changed, the
// value float argument reflects the new value
// of the slider
public void speed(float value) {
  println("speed slider changed: "+value);
  angleSpeed = value;
}