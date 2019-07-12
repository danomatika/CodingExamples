import org.java_websocket.*;
import org.java_websocket.client.*;
import org.java_websocket.drafts.*;
import org.java_websocket.exceptions.*;
import org.java_websocket.handshake.*;

import java.net.URI;
import java.nio.ByteBuffer;
import java.lang.reflect.Method;

// web socket client wrapper which forwards events to PApplet methods:
// webSocketOpened(), webSocketClosed(int code, String reason),
// webSocketReceived(String message), webSocketError(Exception err)
//
// you should not need to use this directly
//
// this is largely derived from the java_websockets client example and
// https://github.com/alexandrainst/processing_websockets
public class WebSocketEventClient extends WebSocketClient {
  
  PApplet parent = null;
  public Method openMethod = null;
  public Method closeMethod = null;
  public Method messageMethod = null;
  public Method errorMethod = null;
  
  public WebSocketEventClient(PApplet p, URI serverURI) {
    super(serverURI);
    parent = p;
    setupMethods();
  }
  
  public WebSocketEventClient(PApplet p, URI serverURI, Draft draft) {
    super(serverURI, draft);
    parent = p;
    setupMethods();
  }

  @Override
  public void onOpen(ServerHandshake handshakedata) {
    if(openMethod != null) {
      try {
        openMethod.invoke(parent);
      }
      catch (Exception e) {
        System.err.println("websocket open event error: " + e);
        e.printStackTrace();
        //openMethod = null;
      }
    }
  }

  @Override
  public void onClose(int code, String reason, boolean remote) {
    if(closeMethod != null) {
      try {
        closeMethod.invoke(parent, code, reason);
      }
      catch (Exception e) {
        System.err.println("websocket: close event error: " + e);
        e.printStackTrace();
        //closeMethod = null;
      }
    }
  }

  @Override
  public void onMessage(String message) {
    if(messageMethod != null) {
      try {
        messageMethod.invoke(parent, message);
      }
      catch (Exception e) {
        System.err.println("websocket: message event error: " + e);
        e.printStackTrace();
        //messageMethod = null;
      }
    }
  }

  @Override
  public void onError(Exception err) {
    if(errorMethod != null) {
      try {
        errorMethod.invoke(parent, err);
      }
      catch (Exception e) {
        System.err.println("websocket: error event error: " + e);
        e.printStackTrace();
        //openMethod = null;
      }
    }
  }
  
  private void setupMethods() {
    try {
      openMethod = parent.getClass().getMethod("webSocketOpened");
    } catch (Exception e) {println(e);}
    try {
      closeMethod = parent.getClass().getMethod("webSocketClosed", int.class, String.class);
    } catch (Exception e) {}
    try {
      messageMethod = parent.getClass().getMethod("webSocketReceived", String.class);
    } catch (Exception e) {}
    try {
      errorMethod = parent.getClass().getMethod("webSocketError", Exception.class);
    } catch (Exception e) {}
  }
  
}
