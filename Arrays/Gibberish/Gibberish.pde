// Gibberish
//
// Generate an array of random visible characters
// and draw them to the screen 1 chunk at a time.
// Click the mouse to advance to the next chunk.
//
// Dan Wilcox 2016

char[] gibberish;    // array of random chars
int numChars = 1024; // how many chars?
int currentChar = 0; // current index in the gibberish array
int chunkSize = 10;  // how many chars to display at a time

void setup() {
  size(400, 400);
  
  // big, centered text
  textSize(64);
  textAlign(CENTER, CENTER);
  
  // create & initialize the gibberish
  gibberish = new char[numChars];
  for(int i = 0; i < gibberish.length; ++i) {
    // random visible char, from SPACE to ~
    // check an ASCII table for details
    byte c = byte(random(32, 126)); 
    gibberish[i] = char(c);  
  }
  
  // print the gibberish
  println("Generated "+numChars+" of gibberish:");
  println("----");
  for(int i = 0; i < gibberish.length; ++i) {
    print(gibberish[i]);  
  }
  println("----");
  
}

void draw() {
  background(0);
  
  fill(255);
  
  // read a chunk of chars into a temp string,
  // start at the current position in the gibberish array
  // and make sure we don't try to read off the end
  String line = new String();
  for(int i = currentChar; i < currentChar+chunkSize && i < gibberish.length; ++i) {
      line = line + gibberish[i];
  }
  text(line, width/2, height/2);
  
  // every 60 frames, go to the next chunk
  if(frameCount % 60 == 0) {
    nextChunk();
  }
}

void mousePressed() {
  nextChunk();
}

// go to the next chunk of text
void nextChunk() {
  currentChar = currentChar + 10;
  
  // wrap around if we've reached the end
  if(currentChar >= gibberish.length) {
    currentChar = 0;  
  }
}