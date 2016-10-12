// Curves
//
// Curve commands demo.
//
// Dan Wilcox danomatika.com 2015

size(400, 400);

background(200);

noFill();
strokeWeight(4);

stroke(200, 100, 100);

// catmull-rom curve
// line is drawn between first & second point,
// curve controlled by placement of 
// start & end control points
curve(100, 20,  // start control point
      100, 100, // first point
      300, 100, // second point
      350, 20); // end control point

stroke(100, 200, 100);

// bezier curve
// line is draw between anchor points,
// control points adjust curve
bezier(100, 220,  // start control point
       100, 300,  // first (anchor) point
       350, 300,  // second (anchor) point
       300, 220); // end cotrol point