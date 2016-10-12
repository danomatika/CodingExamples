// OnOff
//
// Trigger an action every few seconds, in this case: draw an ellipse.
//
// Dan Wilcox danomatika.com 2016

long timestamp = 0;
boolean drawCircle = false;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);

  // if the current time - timestamp is more that 2 s...
  // if the elapsed time is > 2 seconds
  if(millis() - timestamp > 2000) {
      drawCircle = !drawCircle;
      timestamp = millis(); // reset the timestamp to "now"
  }
  
  if(drawCircle) {
    noStroke();
    fill(100, 200, 100);
    ellipse(width/2, height/2, 100, 100);
  }
}