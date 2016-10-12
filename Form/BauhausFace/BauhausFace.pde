// BauhausFace
//
// A static program that draws
// the Bauhaus face logo.
//
// Dan Wilcox danomatika.com 2015

color bgColor = color(255); // white
color faceColor = color(0); // black

boolean trace = false; // see below

size(500, 500);

// I "cheated" by setting a image of the face
// I was tracing as the background so it was easy
// to tell if my positioning and sizing was good,
// the image itself is in the data subfolder inside
// the Sketch folder: Sketch->Show Sketch Folder
if(trace == true) {
  PImage logo = loadImage("logo.gif");
  background(logo);
  // translucent red so it's easy to see overlaps
  faceColor = color(255, 0, 0, 150);
}
else {
  background(bgColor);
}

noStroke();
fill(faceColor);

// eye
rect(158, 99, 73, 73, 4);

// face
rect(270, 299, 22, 126, 4);

// mouth
rect(252, 348, 40, 17, 4);

// neck
rect(216, 418, 59, 79, 4);

noFill();
stroke(faceColor);
strokeWeight(7);

// circle
ellipse(width/2, height/2, 493, 493);

// eye
line(122, 102, 227, 102);
line(227, 102, 227, 204);

// nose
line(294, 8, 294, 302);
line(252, 302, 294, 302);

// chin
line(190, 421, 288, 421);