// FaceFunction
//
// Draw a face with a reusable function.
//
// Dan Wilcox danomatika.com 2016

void setup() {
  size(400, 400);  
}

void draw() {
  background(255);
  
  for(int i = 0; i < 10; ++i) {
    pushMatrix();
    color puke = pukeColor(random(100)/100);
    fill(puke);
    face(random(width), random(height));
    popMatrix();
  }
  
  face(width/2, height/2, 5.0);
}

void face(float x_, float y_) {
  face(x_, y_, 1.0); // default scale to 1.0
}

void face(float x_, float y_, float scale_) {
  
  pushMatrix();
  translate(x_, y_);
  scale(scale_);
    
  // eyes
  ellipse(-15, 0, 10, 20);
  ellipse(15, 0, 10, 20);
  
  // mouth
  line(-20, 30, 20, 30);
  
  popMatrix();
}

// pukiness is 0.0-1.0 which controls the amount of green
color pukeColor(float pukiness) {
  return color(20, 255*pukiness, 30);
}