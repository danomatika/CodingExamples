// PoemTextDynamic
//
// Load a poem from a text file,
// uses a class & dynamic drawing.
//
// Click the mouse to advance each line.
//
// Dan Wilcox danomatika.com 2016

// our poem object, keeps track of the current line for us
Poem poem;

void setup() {
  size(400, 400);
  
  poem = new Poem();
  poem.load("Poem.txt");
}

void draw() {
  background(255);
  
  // update and draw the poem in the middle of the screen
  poem.update();
  poem.draw(width/2, height/2);
}

// change the current line by using the arrow keys
void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      poem.prevLine();
    }
    else if(keyCode == RIGHT) {
      poem.nextLine();
    }
  }
}

// automatically advance to the next line
// if the mouse button is held down
void mousePressed() {
  poem.autoAdvance = true;  
}

void mouseReleased() {
  poem.autoAdvance = false;  
}