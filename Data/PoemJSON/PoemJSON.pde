// PoemJSON
//
// Load a poem from a JSON file (with pos & color)
//
// Dan Wilcox danomatika.com 2016

// our poem as an array of JSON Objects
JSONArray poem;

void setup() {
  size(400, 400);
  
  poem = loadJSONArray("Poem.json");
  println("Loaded "+poem.size()+" lines");
  for(int i = 0; i < poem.size(); ++i) {
    JSONObject line = poem.getJSONObject(i);
    println(i+": "+line.getString("text")); 
  }
}

void draw() {
  background(255);
  
  // draw each line
  for(int i = 0; i < poem.size(); ++i) {
  
    // grab each line as a JSONObject
    JSONObject line = poem.getJSONObject(i);
    
    // grab the data from the object using the key names
    String text = line.getString("text");
    float x = line.getFloat("x");
    float y = line.getFloat("y");
    
    // get the color from the color JSONObject
    JSONObject c = line.getJSONObject("color");
    int red = c.getInt("red");
    int green = c.getInt("green");
    int blue = c.getInt("blue");
    
    // draw the current poem line using the column values
    fill(red, green, blue);
    textAlign(CENTER);
    text(text, x, y);
  }
}