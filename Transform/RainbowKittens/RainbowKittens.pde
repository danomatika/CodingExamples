// RainbowKittens
//
// An animating rainbow kitten mandala
// using the sine & transform functions.
//
// Dan Wilcox danomatika.com 2015

// images
PImage rainbow;
PImage dunecat;
PImage limecat;

// sine wave animation variables
float centerZoom = 0;
float groupDistance = 0;
float groupRotation = 0;

void setup() {
  size(400, 400);
  frameRate(30);
  imageMode(CENTER);
  
  rainbow = loadImage("rainbow.jpeg");
  dunecat = loadImage("dunecat.png");
  limecat = loadImage("lime-cat.png");
}

void draw() {
  background(rainbow);
  
  // 6 rotating lime cats
  for(int i = 0; i < 6; ++i) {
    
    // push the current graphics transform matrix so that
    // any following transforms (translate, rotate, scale)
    // can be applied then reset via the pop function
    //
    // you don't have to indent the lines below, but it makes
    // it easier to see what is inside the pushMatrix() & popMatrix()
    pushMatrix();
    
      // move to the center
      translate(width/2, height/2);
      
      // rotate 60 degrees based on the number of cats so far
      rotate(radians(60)*i);
      
      // move away from the center
      translate(0, sin(groupDistance)*250);
      
      // rotate in place
      rotate(sin(groupRotation)*TWO_PI);
      
      // draw the limecat face
      scale(0.25); // make smaller since image is large
      image(limecat, 0, 0);
    
    // pop all the previous transforms since pushMatrix
    // to go back the original drawing state
    popMatrix();
  }
  
  // dunecat center zoom
  pushMatrix();
    translate(width/2, height/2); // move to the center
    // "zoom" in and out by simply scaling the image larger 
    // and smaller
    scale(sin(centerZoom)*3.0);
    image(dunecat, 0, 0); // draw the cat
  popMatrix(); // pop transforms back to original drawing state
  
  // sine animation parameters,
  // try changing the step sizes below
  groupDistance = groupDistance + 0.025;
  groupRotation = groupRotation + 0.01;
  centerZoom = centerZoom + 0.01;
  // don't want the negative part of sine since < 0 scaling
  // will flip the image upside down
  if(centerZoom > PI) {
    centerZoom = 0;  // go back to zero since sine of PI to 2PI is < 0
  }
}