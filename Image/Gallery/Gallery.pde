// Gallery
//
// Create drawings which are added to an image gallery.
//
// Draw on the screen then press the spacebar when you're
// finished. The drawing will be added to the gallery. Click
// the mouse or press the space bar to create a new drawing.
//
// Dan Wilcox danomatika.com 2016

boolean drawMode = true;
ArrayList<PImage> images;
int maxImages = 16; // max out at 4x4 grid

void setup() {
  size(400, 400);
  background(255);
  images = new ArrayList<PImage>();
}

void draw() {
  if(drawMode) {
    if(mousePressed) {
      strokeWeight(10);
      line(pmouseX, pmouseY, mouseX, mouseY);  
    }
  }
  else { // display the gallery
     background(220);
     int x = 20, y = 20;
     for(int i = 0; i < images.size(); ++i) {
       PImage img = (PImage)images.get(i);
       image(img, x, y, 80, 80);
       x = x + 90;
       if(x + 90 >= width) {
         x = 20;
         y = y + 90;  
       }
     }
  }
}

void keyPressed() {
  if(key == ' ') {
    if(drawMode) {
      PImage img = get(); // get pixels from screen
      images.add(img);
      if(images.size() > maxImages) {
        images.remove(0); // remove the front if we have too many  
      }
      drawMode = false;
    }
    else {
      drawMode = true;
      background(255);
    }
  }
}

void mousePressed() {
  if(drawMode == false) {
    drawMode = true;
    background(255);
  }
}