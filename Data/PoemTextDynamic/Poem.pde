
// the Poem class, wraps the String array
class Poem {
  
  String lines[];
  
  int currentLine = 0;
  
  long timestamp = 0; // how long since we chnaged lines
  int changeTime = 500; // 1/2 second

  boolean autoAdvance = false;

  Poem() {
    // nothing to do here
  }
  
  // load a text file by it's filename
  void load(String filename) {
    lines = loadStrings(filename);
    println("Loaded "+lines.length+" lines");
    for(int i = 0; i < lines.length; ++i) {
      println(i+": "+lines[i]);  
    }
  }
  
  // automatically advance to the next line if enabled
  void update() {
    // check if it's time to choose a new line
    if(autoAdvance == true && millis() - timestamp > changeTime) {
      nextLine();
      // record our new timestamp for when we last changed
      timestamp = millis();
    }
  }
  
  // draw the current line centered on a given position
  void draw(float x, float y) {
    fill(0);
    textAlign(CENTER);
    text(lines[currentLine], x, y);
  }
  
  // go to the previus line in the poem
  void prevLine() {
    currentLine--;
    // if below 0, go to the last line in the array
    if(currentLine < 0) {
      currentLine = lines.length-1;  
    }
  }
  
  // go to the next line in the poem
  void nextLine() {
    currentLine++;
    // if above the end, go to the first line in the array
    if(currentLine >= lines.length) {
      currentLine = 0;  
    }
  }
  
}