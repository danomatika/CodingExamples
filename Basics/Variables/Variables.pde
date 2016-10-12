// Variables
//
// Reusable values referred to by name.
//
// Dan Wilcox danomatika.com 2016

// declare a variable: type name [optional: a default value]
// name -> anything you want (just don't use built in Processing name)
float rectX = 200.2;
float rectY = 150;

size(400, 400);

background(198, 189, 250);

// use the variables declared above for positions below
rectMode(CENTER);
rect(rectX, rectY-100, 50, 50);
rect(rectX, rectY, 100, 100);
rect(rectX, rectY+150, 150, 150);

// let's do some math
int hello = 100;
println(hello);
hello = 200; // assignment: the value of hello is now 200
println(hello);
hello = hello * 2; // multiple the value of hello by 2
println(hello);
hello += 100; // short for: hello = hello + 100
hello *= 2;   // short for: hello = hello * 2;
hello++;      // short for: hello = hello+1 (increment)
hello--;      // short for: hello = hello-1 (decrement)