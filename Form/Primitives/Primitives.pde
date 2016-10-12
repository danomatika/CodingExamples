// Primitives
//
// Basic 2d graphics demo.
//
// Dan Wilcox danomatika.com 2015

// sets the size of the drawing window in pixels
// width & height
size(400, 400);

// draw some points: takes x & y
point(10, 10);
point(100, 100);

// draw a line pixel by pixel
point(10, 11);
point(10, 12);
point(10, 13);
point(10, 14);

// draw a line: takes 2 positions -> start & end
line(10, 10, 100, 100);

// draw a triangle: 3 positions
triangle(120, 20, 200, 70, 120, 70);

// draw a quadrilateral: 4 positions
quad(200, 100,  // pos 1
     300, 100,  // pos 2
     280, 200,  // pos 3
     220, 200); // pos 4
     
// draw a rectangle: 1 position & width/height
rect(10, 120, 100, 50); // default: position is the upper left corner

// draw a square below the rectangle -> equal width & height
rect(10, 200, 50, 50);

// draw an ellipse: 1 position & width & height
ellipse(200, 300, 100, 50); // default: position is center

// draw a circle next to the ellipse -> equal width & height
ellipse(300, 300, 50, 50); 