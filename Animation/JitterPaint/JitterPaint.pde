// JitterPaint
//
// Generate an abstratc painting using 
// speed, direction, and random.
//
// Dan Wilcox danomatika.com 2016

// current pos
float x, y;

// speed/direction of movement
float velX = 0.0;
float velY = 6.0;

// how much to jitter
float jitter = 8;

void setup() {
  size(400, 400);
 
  x = random(width);
  y = random(height);
  fill(220, 100, 100, 100);
  
  noStroke();
  background(255);
}

void draw() {
  
  x = x + velX;
  y = y + velY;
  
  // reset every 100 frames
  if(frameCount % 100 == 0) {
    x = random(width);
    y = random(height);
    fill(random(220), random(220), random(220), 100);
  }
  
  // check if we're off the screen, if so move back
  if(x > width+20) {
    x = -20;  
  }
  if(y > height+20) {
    y = -20;  
  }
  ellipse(x+random(-jitter, jitter), y+random(-jitter, jitter), 40, 40);
 
}