// Shape
//
// Load & display a vector graphic shape file.
//
// Dan Wilcox danomatika.com 2015

// create a shape variable
PShape panda; // not loaded yet!

void setup() {
   size(400, 400); 
   
   // load the shape from the svg file
   panda = loadShape("panda.svg");
}

void draw() {
  
  background(255);
  
  // draw shape from the center
  shapeMode(CENTER);
  
  // draw the shape, give a position & desired size
  shape(panda, width/2, height/2, panda.width*0.5, panda.height*0.5);
}