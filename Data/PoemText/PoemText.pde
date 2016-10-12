// PoemText
//
// Load a poem from a text file
//
// Dan Wilcox danomatika.com 2016

// our poem as an array of line Strings
String poem[];

void setup() {
  size(400, 400);
  
  poem = loadStrings("Poem.txt");
  println("Loaded "+poem.length+" lines");
  for(int i = 0; i < poem.length; ++i) {
    println(i+": "+poem[i]);  
  }
}

void draw() {
  background(255);
  
  // draw the poem line by line
  for(int i = 0; i < poem.length; ++i) {
    fill(0);
    textAlign(CENTER);
    text(poem[i], 100 + i*40, 100 + i*40);
  }
}