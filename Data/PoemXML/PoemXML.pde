// PoemXML
//
// Load a poem from an XML file (with pos & color)
//
// Dan Wilcox danomatika.com 2016

// our poem as an array of XML elements
XML lines[];

void setup() {
  size(400, 400);
  
  XML poem = loadXML("Poem.xml");
  lines = poem.getChildren("line");
  println("Loaded "+lines.length+" lines");
  for(int i = 0; i < lines.length; ++i) {
    XML text = lines[i].getChild("text");
    println(i+": "+text.getContent());  
  }
}

void draw() {
  background(255);
  
  // draw each line
  for(int i = 0; i < lines.length; ++i) {
  
    // grab each line as an element
    XML line = lines[i];
    
    // grab the data from the child elements
    String text = line.getChild("text").getContent();
    float x = line.getChild("x").getFloatContent();
    float y = line.getChild("y").getFloatContent();
    
    // grab the color values from the "color" child
    XML c = line.getChild("color");
    int red = c.getChild("red").getIntContent();
    int green = c.getChild("green").getIntContent();
    int blue = c.getChild("blue").getIntContent();
    
    // draw the current poem line using the loaded values
    fill(red, green, blue);
    textAlign(CENTER);
    text(text, x, y);
  }
}