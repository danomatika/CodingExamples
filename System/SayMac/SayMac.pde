// SayMac
//
// Type some text and the computer will speak it to you.
// Delete characters with the backspace/delete key and
// talk with enter.
//
// Note: requires macOS as this uses the "say" command
//
// Dan Wilcox danomatika.com 2016

String whatToSay = "hello world";

// for blinky cursor
boolean drawCursor = true;
long blinkTimestamp = 0;

void setup() {
  size(600, 200); 
  textSize(30);
  textAlign(CENTER, CENTER);
  noStroke();
}

void draw() {
  background(255);
  
  // text
  fill(100);
  text(whatToSay, width/2, height/2);
  
  // blinky cursor
  if(drawCursor) {
    float w = textWidth(whatToSay);
    fill(200);
    rect(width/2 + w/2, height/2 - 12, 8, 30);
  }
  if(millis() - blinkTimestamp > 500) {
    drawCursor = !drawCursor;
    blinkTimestamp = millis();
  }
}

void keyPressed() {
  if(key >= ' ' && key < DELETE) { // allow visible ASCII chars only
    whatToSay  = whatToSay  + char(key); // add to end of text
  }
  else if(key == DELETE || key == BACKSPACE) { // delete last char
    if(whatToSay.length() > 0 ) { // make sure we don't try this when empty
      whatToSay = whatToSay.substring(0, whatToSay.length()-1);  
    }
  }
  else if(key == ENTER) { // run the say command with the current text
    // build the command to execute, this is euqivalent to running "say"
    // on the commandline (aka in Terminal)
    String cmd[] = { "/usr/bin/say", "\""+whatToSay +"\"" };
    exec(cmd); // run command on the command line
    whatToSay  = ""; // clear after running
  }
}