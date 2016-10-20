// LaserLerp
//
// Draw a "laser" line using lerp between
// a start and end pos at differing speeds.
//
// Dan Wilcox 2016

// start
float x1 = 100;
float y1 = 100;

// end
float x2 = 500;
float y2 = 100;

// animation variables for lerp,
// these are percentages from 0-1.0
float start = 0;
float end = 0;

void setup() {
  size(600, 200);  
  strokeWeight(4);
  strokeCap(SQUARE);
}

void draw() {
  background(255);
  
  // reference line
  stroke(240);
  line(x1, y1, x2, y2);
  
  // laser line
  stroke(0);
  line(lerp(x1, x2, start),
       lerp(y1, y2, start),
       lerp(x1, x2, end),
       lerp(y1, y2, end));
  
  // move first point faster
  if(start < 1.0) {
    start += 0.01;
  }
  
  // don't move end until start is 25% in
  // move first point slower,
  if(start > 0.25 && end < 1.0) {
    end += 0.005;
  }
  
  // if both are at the end pos, reset
  if(start > 1.0 && end > 1.0) {
    start = 0;
    end = 0;
  }

  // status text
  fill(0);
  text("start: "+int(start*100)+"%", 10, 20);
  text("end: "+int(end*100)+"%", width-64, 20);
}