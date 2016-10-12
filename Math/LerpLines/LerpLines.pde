// LerpLines
//
// Draw 10 evenly spaced lines
// between the left side of the window
// and the mouse. Uses the lerp() function
// to interpolate the x pos for each line.
//
// Dan Wilcox danomatika.com 2015

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  for(int i = 0; i < 10; ++i) {
    float x = lerp(0, mouseX, i/10.0);
    line(x, 0, x, height);
  }
}
 