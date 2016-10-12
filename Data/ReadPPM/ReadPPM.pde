// ReadPPM
//
// Read the last PPM value in the weekly NOAA co2 data copied from
// ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_weekly_mlo.txt.
// 
// Dan Wilcox danomatika.com 2016

float ppm;
int month, day, year;

String co2weekly = "co2_weekly_mlo.txt";

void setup() {
  size(200, 200);
  if(fetchPPM()) {
    println("loaded data");  
  }
}

void draw() {
 background(255);
 fill(0);
 text("ppm for "+year+"-"+month+"-"+day+": "+ppm, 20, height/2);
}

boolean fetchPPM() {
   String rows[] = loadStrings(co2weekly);
   if(rows.length > 0) {
     String lastRow = rows[rows.length-1];
     
     // clean up by removing any extra spaces between fields
     String cleanLastRow = "";
     boolean foundSpace = false;
     for(int i = 0; i < lastRow.length(); ++i) {
         if(lastRow.charAt(i) == ' ') {
           if(foundSpace == false) {
             cleanLastRow += lastRow.charAt(i);
             foundSpace = true;
           }   
         }
         else {
           cleanLastRow += lastRow.charAt(i);
           foundSpace = false;
         }
     }
     
     // split the fields by spaces
     String cols[] = split(cleanLastRow, ' ');
     
     // load the data from the fields
     year = int(cols[1]);
     month = int(cols[2]);
     day = int(cols[3]);
     ppm = float(cols[5]);
     
     return true;
   }
   else {
     return false;
   }
}