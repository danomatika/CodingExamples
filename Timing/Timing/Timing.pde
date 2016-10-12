// Timing
//
// Timing using frameCount & millis().
//
// Dan Wilcox 2016

void setup() {
  size(400, 400);
  
  frameRate(60);
  noStroke();
}

void draw() {
  background(255);
  
  // display after 60 frames (frame rate dependent)
  if(frameCount > 60) { // 2 seconds @ 30 fps
    fill(200, 100, 100);
    ellipse(width/2, height/2-100, 100, 100);
  }
  
  // display after 2 seconds (frame rate independent)
  if(millis() > 2000) {
    fill(100, 200, 100);
    ellipse(width/2, height/2+100, 100, 100);
  }
}