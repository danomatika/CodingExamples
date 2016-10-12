// NeoConsole
//
// A simple console conversation using text & a font.
//
// Dan Wilcox danomatika.com 2016

// declare my font variable, *not* loaded yet!
PFont font;

String console = ">> how are you neo?\n>> who are you?\n>> follow the white rabbit";

void setup() {
  size(400, 400);
  
  // loads a font by name & sets the font size in points
  //font = createFont("HelveticaNeue", 24); // system font
  font = createFont("Minecraft.ttf", 16); // font file
  
  // list the fonts available on this computer
  //printArray(PFont.list());
}

void draw() {
  background(0);
  
  // set the font to use
  textFont(font); // draw using the font we loaded
  
  // draw with a redish color
  fill(0, 255, 0);
  
  // scale the text size,
  // scaling a small font larger will be pixelated
  //textSize(12);
  
  // set the alignment when drawing the text
  // default: LEFT horz, CENTER vert
  textAlign(LEFT, CENTER);
  //textAlign(LEFT, TOP);
  //textAlign(RIGHT, BOTTOM);
  
  // set the vertical space between lines, defaults to font size
  textLeading(48); // twice as high
  
  // draw some text with the font
  text(console, 24, height/2);
  
  // what's the width a a string at the current font & font settings
  println("text has width: "+textWidth(console));
}