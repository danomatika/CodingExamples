// Countdown
//
// A simple countdown timer that triggers an event.
//
// Dan Wilcox danomatika.com 2016

Timer timer;
float howLong = 10; // how long to run in seconds
boolean running = true; // is the timer running?

// dispay font
PFont font;

// background color
color bg = color(200);

void setup() {
  size(400, 400); 
  
  timer = new Timer();
  
  font = createFont("Helvetica", 40);
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(bg);
  
  // draw current time since last timestamp
  text("Time", width/2, height*0.2);
  text(timer.timeSeconds(), width/2, height*0.35);
  
  // draw the current countdown time
  // aka countdownTime - current time 
  text("Countdown", width/2, height*0.6);
  float secondsToGo = timer.diffSeconds(howLong);
  if(running && secondsToGo > 0) {
    text(secondsToGo, width/2, height*0.75);
  }
  else {
    if(running) {
      // this will be called once when the timer reaches 0
      println("countdown time was reached");
      running = false; // done
      bg = color(220, 120, 120);
    }
    text("Timer finished!\nClick to restart", width/2, height*0.75);
  }
}

void mousePressed() {
  // restart the timer if it's not running
  if(!running) {
    timer.set();
    running = true;
    bg = color(200);
    println("timer reset");
  }
}