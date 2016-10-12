// StringVariable
//
// Text variable for a string of characters.
//
// Dan Wilcox danomatika.com 2016

String hello = "hello world";
String foo = "foo bar";
String wee = "waa";

// escape the double quote char using a backslash \"
// this way the " is included in our String
String ka = "my name is \"Jonas\""; // my name is "Jonas"

// ecaping other special characters:
// \t - tab char
// \n - endline char (move to a new line)
// \\ - backslash
String mema = "hello\tworld\nfoo\t\\bar\\";

// compare if a string is equal to another
// do *not* use == to compare Strings in Processing!
if(wee.equals("wee")) {
  println(hello+" "+foo);
}

println(ka);
println(mema);

// get the length of the string with string.length()
println("mema has length: "+mema.length());