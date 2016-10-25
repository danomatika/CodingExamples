// Earthquakes!
//
// Fetch earthquake data from the USGS via their web API:
// http://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
//
// Dan Wilcox 2016

// the API returns data in JSON
JSONObject data; 

void setup() {
  size(800, 600);
  
  // grab via urls, different urls return different datasets
  data = loadJSONObject("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/1.0_month.geojson");
  //data = loadJSONObject("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson");
  //data = loadJSONObject("http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.geojson");
  println(data.getJSONObject("metadata").getString("title"));
  
  // print the earthquakes we have retrieved
  JSONArray features = data.getJSONArray("features");
  println("Features: "+ features.size());
  for(int i = 0; i < features.size(); ++i) {
    
   // earthquake features temp object
   JSONObject f = features.getJSONObject(i);
   
   // print earthquake properties
   JSONObject prop = f.getJSONObject("properties");
   println(" " +prop.getFloat("mag")+" "+prop.getString("place")+" "+prop.getInt("time")); 
   
   // print earthquake coordintaties
   JSONArray coords = f.getJSONObject("geometry")
                       .getJSONArray("coordinates");
   println("     "+coords.getFloat(0)+" "+coords.getFloat(1)); // lon & lat
  }
  
  // white background
  background(255);
}

void draw() {
  
  // draw each earthquake using it's lat & lon
  JSONArray features = data.getJSONArray("features");
  for(int i = 0; i < features.size(); ++i) {
    JSONObject f = features.getJSONObject(i);
    
    // magnitude on the richter scale
    float mag = f.getJSONObject("properties").getFloat("mag");
    
    // geo coords
    JSONArray coords = f.getJSONObject("geometry").getJSONArray("coordinates");
                               
    // convert the earthquake data ranges to ranges
    // we can use in Processing to draw things
    float lon = coords.getFloat(0);
    float lat = coords.getFloat(1);
    float x = map(lon, -180, 180, 0, width); // lon -> xpos
    float y = map(lat, 90, -90, 0, height);  // lat -> ypos
    float radius = map(mag, 0, 10, 0, 50);   // richter -> circle size
    
    // draw
    noStroke();
    fill(100, 100);
    ellipse(x, y, radius, radius);                            
  }

  // draw once, then stop
  noLoop();
}