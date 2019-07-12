java_websocket for Processing
=============================

Dan Wilcox danomatika.com 2019

Example wrapper for using the java_websockets library with Processing:

    https://github.com/TooTallNate/Java-WebSocket

This is a nice 100% Java library which includes SSL support (wss:// addresses)
and built in ping-pong connection handling.

References:
* https://stackoverflow.com/a/18914869
* https://github.com/TooTallNate/Java-WebSocket/wiki/Lost-connection-detection
* https://github.com/TooTallNate/Java-WebSocket/blob/master/src/main/java/org/java_websocket/client/WebSocketClient.java

Installing java_websockets libraries
------------------------------------

This requires installing a couple JAR files in Processing's sketchbook folder:

* java_websockets
* slf4j-api
* slf4j-simple

The steps required are as follows:

1. Download the Java-Websocket release zip (with dependencies) from
   https://github.com/TooTallNate/Java-WebSocket/releases
2. Open the Processing sketchbook folder with your file browser,
   the easiest way is the "Browse" button in the Processing Preferences window
3. In the sketchbook "libraries" folder, create a "java_websockets" folder
4. Copy the Java-Websocket "library" folder from the zip into the new
   "java_websockets" folder, so the overall layout looks like this:

	/Processing/libraries/java_websockets/
	/Processing/libraries/java_websockets/library/
	/Processing/libraries/java_websockets/library/java_websockets.jar
	/Processing/libraries/java_websockets/library/slf4j-api.###.jar
	/Processing/libraries/java_websockets/library/slf4j-simple.###.jar

5. Restart Processing, then try running the java_websockets sketch

If you download the java_websockets.jar but are missing the slf4j files, you
can get them from https://www.slf4j.org/download.html
