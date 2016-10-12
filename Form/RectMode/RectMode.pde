// RectMode
//
// Rectangle & ellipse drawing mode demo.
//
// Dan Wilcox danomatika.com 2015

size(400, 400);

// default pos: upper left corner
rect(100, 100, 100, 100);

// now draw rectangles with the pos -> center
rectMode(CENTER);

// draw with the same parameters, is drawn to upper left of the first
rect(100, 100, 100, 100);

// same with ellipses

// default pos: center
ellipse(300, 300, 100, 100);

// now draw ellipses with pos -> upper left corner
ellipseMode(CORNER);

// draw with same params, is drawn to lower right of the first
ellipse(300, 300, 100, 100);