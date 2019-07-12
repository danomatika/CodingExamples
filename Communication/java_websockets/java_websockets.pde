// java_websocket
//
// Example wrapper for using the java_websockets library
// with Processing:
//
//     https://github.com/TooTallNate/Java-WebSocket
//
// Note: This requires a few library JAR files, see
//       README.txt in this sketches folder
//
// Dan Wilcox danomatika.com 2019

WebSocket ws = null;
String wsHostname = "wss://echo.websocket.org";

void setup() {
  ws = new WebSocket(this, wsHostname);
}

void draw() {
  if(ws.update()) {
    // this is here to see the echo response from the server,
    // it's not needed to keep the connection open
    println("sending ping");
    ws.send("ping");
  }
}

// websocket open callback
void webSocketOpened() {
  println("websocket: opened connection to " + wsHostname);
}

// websocket closed callback
void webSocketClosed(int code, String reason) {
  println("websocket: closed with exit code " + code + ": " + reason);
}

// websocket message received callback
void webSocketReceived(String message) {
  println("websocket: received message: " + message);
}

// websocket error callback
void webSocketError(Exception err) {
  System.err.println("websocket: error occurred: " + err);
}
