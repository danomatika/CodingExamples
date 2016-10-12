// Conditionals
//
// if this, do that (aka logic):
// * if
// * else
// * else if
//
// Dan Wilcox danomatika.com 2015

size(400, 400);

rectMode(CENTER);

// random rectangle pos (keep on the screen)
int x = int(random(50, width-50)); // convert float to int
int y = int(random(50, height-50));

// math comparisons:
// > - greater than
// < - lesser than
// >= - greater than or eual to
// <= - lesser than or equal to
// == - equal -> this is *not* the same as =
// != - not equal

// choose fill color based on x position
if(x <= 130) {
  println("x is less than 130");
  fill(255, 100, 100); // redish
}
else if(x < 260) {
  println("x is less than 260");
  fill(100, 255, 100); // greensih
}
else { // x > 260
  println("x is greater than 260");
  fill(100, 100, 255); // blueish
}

// show the screen divisions
line(130, 0, 130, height);
line(260, 0, 260, height);

// if y is exactly 200, fat lines
if(y == 200) {
  strokeWeight(5);
}
else { // not 200
  strokeWeight(1);
}

// draw rectangle with current fill color
rect(x, y, 50, 50);

// && - and, if A and B are true
// || - or, if A or B are true
// ! - not, if A is not true (negated)
boolean A = true;
boolean B = false;

if(A == true && B == true) {
  println("both A and B are true");  
}
else if(A == true || B == true) {
  println("either A or B are true");
}
else {
  println("neither A or B are true");
}