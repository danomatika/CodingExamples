
// a base class for a button with colored interaction states
class Button {
  
  // button position
  PVector pos;
  
  // is the mouse currently over the button?
  boolean isOver = false;
  
  // was this button clicked? if so, then show the click color
  boolean wasClicked = false;
  
  color normalColor = color(220, 120, 120); // normal color
  color hoverColor = color(220, 220, 120); // color when mose is over
  color clickColor = color(120, 120, 220); // color when clicked
  
  // timestamp from what the button was last clicked
  long clickTimestamp;
  
  // how long in milliseconds to show a click
  int clickTime = 500;
  
  // check if the mouse is over and choose the appropriate color,
  // call this in the subclass draw() function with super.draw();
  void draw() {
    
    // check if the mouse is inside the buton aka isOver
    isOver = inside(mouseX, mouseY);
    
    // choose color based on current states
    if(wasClicked && millis() - clickTimestamp < clickTime) {
      // was clicked
      fill(clickColor);
    }
    else {
      // not clicked
      wasClicked = false;
      if(isOver == true) {
        fill(hoverColor);
      }
      else {
        fill(normalColor);
      }
    }
    
    // doesn't actually draw anything, do that in the sub class
  }
  
  // returns true if the given position was inside the button
  boolean inside(float x, float y) {
    // implement in child class
    return false;
  }
  
  // send a click event
  // returns true if the mouse is over it the button
  // wasn't clicked before
  boolean click() {
    if(isOver == true && wasClicked == false) {
      showClick();
      return true;
    }
    return false;
  }
  
  // activate the click color animation
  void showClick() {
    clickTimestamp = millis();
    wasClicked = true;
  }
}