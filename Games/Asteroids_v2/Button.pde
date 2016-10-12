
// I keep clicking but nothing happens!
class Button {
  // Position and hue
  float x, y, h;
  // Text
  String t;
  // Button index
  int c;
  
  Button(float x, float y, float h, String t, int c) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.t = t;
    this.c = c;
  }
  
  // Renders the button
  void display() {
    textSize(40);
    if (selection == c) {
      stroke(h, 192, 192);
      fill(h, 128, 255);
    }
    else {
      stroke(h, 192, 96);
      fill(h, 128, 128);
    }
    strokeWeight(8);
    ellipse(x, y, 64, 64);
    fill((h+32)%256, 255, 255);
    text(t, x-16, y+16);
  }
}