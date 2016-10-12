// BouncingBalls
//
// Manage a set of bouncing balls with a arrays.
//
// Dan Wilcox danomatika.com 2015

int numCircles = 10;

// circle arrays
float[] posX, posY; // position
float[] velX, velY; // velocity
color[] colors; // fill color
boolean[] caught; // true if the circle was caught by the mouse

int numCaught = 0; // how many circles have been caught?

float circleSize = 40;

void setup() {
  size(400, 400);
  
  // setup the arrays so they have space
  // for each circle
  posX = new float[numCircles];
  posY = new float[numCircles];
  velX = new float[numCircles];
  velY = new float[numCircles];
  colors = new color[numCircles];
  caught = new boolean[numCircles];
  
  // init the position & velocity of each circle
  for(int i = 0; i < numCircles; ++i) {
    setupCircle(i);
  }
}

void draw() {
  background(100);
  
  // loop through and update eaach circle
  for(int i = 0; i < numCircles; ++i) {
    updateCircle(i);
    
    // reset color if all the circles were caught
    if(numCaught >= numCircles) {
      randomColorCircle(i);
    }
    
    drawCircle(i);
  }
  
  // reset value
  if(numCaught >= numCircles) {
    numCaught = 0;
  }
}

// custom functions

// setup a circle at a specific index
void setupCircle(int i) {
  
  posX[i] = width/2;
  posY[i] = height/2;
    
  velX[i] = random(-4, 4);
  velY[i] = random(-4, 4);
  
  randomColorCircle(i);
  
  caught[i] = false;
}

void randomColorCircle(int i) {
  colors[i] = color(random(255), random(255), random(255));
}

// update a circle at a specific index
void updateCircle(int i) {
    
  // update the position
  posX[i] = posX[i] + velX[i];
  posY[i] = posY[i] + velY[i];
  
  // check boundaries
  if(posX[i] < circleSize/2 || posX[i] > width-circleSize/2) {
    velX[i] = -velX[i]; // turn around  
  }
  if(posY[i] < circleSize/2 || posY[i] > height-circleSize/2) {
    velY[i] = -velY[i]; // turn around  
  }
  
  // if the mouse hovers over, change to white
  float d = dist(posX[i], posY[i], float(mouseX), float(mouseY));
  if(d < circleSize/2) {
      colors[i] = color(255); // white
      
      // catch when a circle was caught for the first time
      if(caught[i] == false) {
        numCaught++;  
      }
      caught[i] = true;
  }
}

// draw a circle at a specific index
void drawCircle(int i) {
  
  // draw the circle
  noStroke();
  fill(colors[i]);
  ellipse(posX[i], posY[i], circleSize, circleSize);
}