// Millis
//
// Timing using milliseconds.
//
// Dan Wilcox danomatika.com 2016

// millis() returns the number of milliseconds (1000th of a second)
// since the program was started, you can use it for timing things

// time value variable,
// use a "long" as it has more space than a regular int
// and then umber of milliseconds adds up quickly
long timestamp = 5000;

float x, y;

boolean show = false;

void setup() {
  size(400, 400); 
  frameRate(60);
  
  x = width/2;
  y = height*0.25;
}

void draw() {
  background(100);

  noStroke();
  
  // if the current time minus our last timestamp
  // is more than 1 second, the difference between the
  // timestamp and the current time
  if(millis() - timestamp > 1000) {
    show = !show;
    timestamp = millis(); // update the timestamp
    println("timer reached: "+millis());
  }
  
  // toggle drawing an ellipse every second
  if(show) {
    fill(220, 120, 120);
    ellipse(x, y, 50, 50);  
  }

  // if the amount of milliseconds since the
  // program started is more than a second,
  // draw an ellipse
  //
  // this is framerate independent
  if(millis() > 1000) {
    fill(120, 220, 120);
    ellipse(width*0.25, height/2, 50, 50);
  }

  // use framerate timing, will be different
  // based on the current framerate
  if(frameCount > 45) {
    fill(120, 120, 220);
    ellipse(width*0.75, height/2, 50, 50);  
  }
}