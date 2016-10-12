// Syntax
//
// The basic rules of the language.
//
// Dan Wilcox danomatika.com 2016

// single line comment, ignored by Processing
/* begin

 multiline comment
 
 comments can be useful as notes to yourself/others

end */

// expression -> do some math
int x = 11; // ALWAYS end with a semicolon!

// statement -> run a command
size(400, 200); // ALWAYS ends with a semicolon

// prints to the screen
println("hello world");

// statement -> do a comparison
if(x > 10) { // no semicolon
  
  println("x is greater than 10");
  
  // block of code to be run is encapsuated by
  // curly brackets {}
  
  // do something if x is greater than 10
  rect(10, 10, 100, 100);
}