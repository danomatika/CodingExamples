import java.util.concurrent.TimeUnit;

// web socket client wrapper which forwards recieved events
// to callback methods
//
// includes simple autoreconnect handling, try enabling/disabling
// your network connection to test
class WebSocket {
  
  protected PApplet parent = null;
  protected WebSocketClient client = null;
  
  static final int connectTimeout = 5; // seconds
  static final int connectionLostTimeout = 10; // seconds
  static final long updateMS = 5000;
 
  protected long updateTimestamp = 0;
  protected boolean reconnecting = false;
  protected int reconnectTries = 0;
  
  WebSocket(PApplet p, String hostname) {
    parent = p;
    setupClient(hostname);
  }
  
  // check connection and reconnect if needed,
  // returns true if the connection is open
  boolean update() {
    if(millis() - updateTimestamp > updateMS) {
        if(client.isOpen()) {
          if(reconnecting) {
            println("websocket: reconnected");
            reconnecting = false;
          }
          updateTimestamp = millis();
          return true;
        }
        else if(!reconnecting) {
          println("websocket: trying reconnect");
          client.reconnect();
          reconnecting = true;
        }
        else {
          reconnectTries++;
          println("websocket: waiting to reconnect..." + reconnectTries);
          if(reconnectTries > 4) {
            client.close();
            reconnectTries = 0;
            reconnecting = false;
          }
        }
        updateTimestamp = millis();
      }
      return false;
  }
  
  // send a message, ignored if the connection is not open
  void send(String message) {
    if(client.isOpen()) {
      client.send(message);
    }
  }
  
  // get the server hostname
  String getHostname() {
    if(client != null) {
      return client.getURI().toString();
    }
    return "";
  }
  
  // setup web socket client
  protected void setupClient(String hostname) {
    try {
      client = new WebSocketEventClient(parent, new URI(hostname));
      client.setConnectionLostTimeout(connectionLostTimeout);
    }
    catch(Exception e) {
      System.err.println("websocket: bad URI: " + e);
      client = null;
      return;
    }
    try {
      client.connectBlocking(connectTimeout, TimeUnit.SECONDS);
    }
    catch(InterruptedException e) {
      System.err.println("websocket: connect interrupted: " + e);
    }
  }
  
}
