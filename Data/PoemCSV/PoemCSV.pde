// PoemCSV
//
// Load a poem from a CSV file (with pos & grayscale color).
//
// Dan Wilcox danomatika.com 2016

// our poem as comma-separated value data,
// where each row is 1 line in the poem and
// includes position & grayscale values
Table poem;

void setup() {
  size(400, 400);
  
  poem = loadTable("poem.csv", "header");
  println("Loaded "+poem.getRowCount()+" lines");
  for(int i = 0; i < poem.getRowCount(); ++i) {
    TableRow row = poem.getRow(i);
    println(i+": "+row.getString("line"));  
  }
}

void draw() {
  background(255);
  
  // draw each line
  for(int i = 0; i < poem.getRowCount(); ++i) {
  
    // grab each line as a table row
    TableRow row = poem.getRow(i);
    
    // grab the data form the row using the column header keys
    String line = row.getString("line");
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    int gray = row.getInt("gray"); 
    
    // draw the current poem line using the column values
    fill(gray);
    textAlign(CENTER);
    text(line, x, y);
  }
}