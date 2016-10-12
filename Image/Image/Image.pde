// Image
//
// Load & display an image with an overlay using a second image.
//
// Dan Wilcox danomatika.com 2016

// image object, not loaded yet!
PImage duckling;
PImage sunglasses;

void setup() {
  size(400, 400);
  
  // load the image, now duckling is loaded
  duckling = loadImage("duckling.jpg");
  sunglasses = loadImage("sunglasses.png");
  
  // print the size of the image
  println("image is "+duckling.width+"x"+duckling.height);
}

void draw() {
  background(255, 254, 252);
  
  // draw the image at 0,0 (upper left corner)
  //image(duckling, 0, 0);
 
  // draw the image at 0,0 & stretch to fit window
  //image(duckling, 0, 0, width, height);
  
  // draw images from the center
  imageMode(CENTER);
  
  // tint the color of the image
  tint(240, 220, 240); // sort of like fill() for images
  noTint(); // like noFill() -> equivalent to tint(255);
  
  // compute aspect ratio so we dont stretch the image
  // convert image sizes from ints to float for decimal divison
  float aspect = float(duckling.width)/float(duckling.height);
  image(duckling, width/2, height/2, width*aspect, height);
  
  // draw the sunglasses on top
  image(sunglasses, 238, 112, sunglasses.width*0.65, sunglasses.height*0.65);
}