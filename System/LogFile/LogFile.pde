// LogFile
//
// It is sometimes useful to save the console output to a file, especially
// for long-running programs in an exhibition environment. Being able to 
// get a txt file with program output helps with "remote debugging."
//
// Dan Wilcox danomatika.com 2019

FileLogger logger = null;
String logFile = "log.txt";
long timestamp = 0;

void setup() {
  println("hello console");
  
  // create logger and start logging to file,
  // this means every print() & println() now writes
  // to the file instead of the Processing console
  logger = new FileLogger(logFile);
  logger.logToFile();
  println("hola file");
}

void draw() {
  
  // write a message to the file every 2 s
  if(millis() - timestamp > 2000) {
    println("hallo alle");
    timestamp = millis();
  }
}
