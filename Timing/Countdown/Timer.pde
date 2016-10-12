
// a timer class
// wraps comparing a timestamp with the current millis
class Timer {

  long timestamp = 0;
  
  // set the timer
  void set() {
    timestamp = millis();
  }
  
  // how long the timer has been running in milliseconds
  long time() {
    return millis() - timestamp;
  }
  
  // how long the timer has been running in seconds
  float timeSeconds() {
    return time() / 1000.0; 
  }
  
  // how long the timer has been running subtracted from
  // a given number of seconds, useful for countdowns
  float diffSeconds(float seconds) {
    return seconds - timeSeconds();
  }
}