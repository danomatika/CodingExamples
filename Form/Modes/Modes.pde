// Modes
//
// Stroke, fill, & strokeWeight drawing modes.
//
// Dan Wilcox danomatika.com 2015

size(400, 400); // square

//background(200); // grayscale 0-255
background(170, 240, 230); // color r, g, b 0-255
//background(0, 255, 255);
//background(#E8D049); // hex color from the web

// sets the fill color for all objects afterwards
fill(188, 61, 152);

// sets the stroke (line/outline) color for everything afterwards
stroke(52, 18, 255);
rect(10, 10, 100, 200);

// disables stroke for everything after
noStroke(); // <- takes no params
rect(120, 10, 100, 200);

// disables fill for everything after
noFill(); // <- takes no params
stroke(52, 18, 255); // set the stroke again
rect(240, 10, 100, 200);

// line drawn with the current stroke color
line(10, 220, 340, 220);

// set a fat line! default: 1
strokeWeight(10);

// fat line, yo
line(10, 240, 340, 240);

// not as fat
strokeWeight(5);
line(10, 260, 340, 260);