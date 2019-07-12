
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.PrintStream;
import java.io.FileOutputStream;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

// this is a convenice class which creates a file PrintStream
// and switches the current System.out (aka print() & println()),
// currently writes to a file on the users Desktop
class FileLogger {

  protected String fileName = "processing_log.txt";
  protected String desktopName = "Desktop";
  
  static final int maxLength = 200000; // max length in bytes (200 kB)

  protected File file = null;
  protected PrintStream fileStream = null;
  protected PrintStream consoleStream = null;
  
  // create a file logger with default file name on the Desktop
  FileLogger() {
    consoleStream = System.out;
  }
  
  // create a file logger with a given log file name on the Desktop
  FileLogger(String fileName) {
    this.fileName = fileName;
    consoleStream = System.out;
  }
  
  // create a file logger with a given log file name &
  // set Desktop folder name (might be needed for non-English systems)
  FileLogger(String fileName, String desktopName) {
    this.fileName = fileName;
    this.desktopName = desktopName;
    consoleStream = System.out;
  }
  
  // direct system output to file, appends new content or overwrites
  // if the file is already too large, adds a separater and timestamp
  void logToFile() {
    setupFileStream();  
    if(fileStream != null) {
      System.setOut(fileStream);
      DateFormat formatter = new SimpleDateFormat("yy-MM-dd HH:MM:ss");
      println("\n========================================\n" +
              formatter.format(new Date()) + "\n");
    }
  }
  
  // direct system output to console (default)
  void logToConsole() {
    if(fileStream != null) {
      clearFileStream();
    }
    System.setOut(consoleStream);
  }
  
  // create the file and print stream
  protected void setupFileStream() {
    if(fileStream != null) {return;}
    try {
      Path path = Paths.get(System.getProperty("user.home"), desktopName, fileName);
      file = new File(path.toString());
      if(file.length() > maxLength) {
        // overwrite
        println("FileLogger: overwriting " + fileName);
        fileStream = new PrintStream(file);
      }
      else {
        // append
        fileStream = new PrintStream(new FileOutputStream(file, true));
      }
    }
    catch (Exception e) {
      System.err.println("FileLogger: could not create file stream: " + e);  
      fileStream = null;
    }
  }
  
  // clear the file stream and close the file
  protected void clearFileStream() {
    fileStream = null;
    file = null;
  }
  
}
