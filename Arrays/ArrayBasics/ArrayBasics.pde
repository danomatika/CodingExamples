// ArrayBasics
//
// Simple array usage basics.
// All output is to the console.
//
// Dan Wilcox danomatika.com 2016

// creates a array of ints & initializes it with a set of numbers
// note: creates with a set length
int[] numbers = {13, 23, 4, 585, -2, 29, 56}; 

// declare an array of Strings, this is not created yet!
String[] hello;

// control the number of strings to generate
int numberStrings = 10;

// set the number at index 0 to 100
numbers[0] = 100;

// using the brackets, we can access one of the ints via it's index
// in this case 0 is the first index
println("numbers 0: "+numbers[0]); // first index
println("numbers 1: "+numbers[1]); // second index
println("numbers 2: "+numbers[2]); // third index
println("numbers 3: "+numbers[3]); // fourth index
println("numbers 4: "+numbers[4]); // fifth index

// loops through the array & prints each index & value at that index
for(int i = 0; i < numbers.length; i++) {
  println("array numbers " + i + ": " + numbers[i]);  
}

// create out string array, the values are not set yet!
hello = new String[numberStrings];

// setting up the array
// set the values inside the array
for(int i = 0; i < hello.length; i++) {
    hello[i] = "hello ";
    
    // generate a random 4 character name
    for(int j = 0; j < 4; j++) {
       hello[i] = hello[i] + char(int(random(float('A'), float('Z')))); 
    }
    
    println("hello " + i + ": " + hello[i]);
}