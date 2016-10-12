// LineTargets
//
// Move a series of lines towards their
// 1d targets. Uses arrays to store the
// initial line & target positions.
//
// Dan Wilcox danomatika.com 2015

float lines[] = { 10, 20, 40, 50 };
float targets[] = { 400, 200, 300, 100};
float easing = 0.01;

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  
  for(int i = 0; i < lines.length; ++i) {
    stroke(map(float(i), 0, float(lines.length), 100, 255));
    float x = lines[i] + (targets[i]-lines[i]) * easing;
    line(x, 0, x, height);  
    lines[i] = x; // update
  }
}