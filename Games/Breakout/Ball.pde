/*******Ball Class**************/
/* The default class has the following default modes
 * Constructor function: to create a new ball call:
               Ball ballName= new Ball(x, y, Width, Color);
 * ballName.draw();  //this draws the ball
 * ballName.update(); //this moves the ball
 * ballName.checkWallCollision(); //
 */
class Ball {
  float ballX;
  float ballY;
  float ballWidth;
  color ballColor;
  float speedY= -10;
  float speedX= 10;
  float ballR=ballWidth/2;
  
  //This is constructor known as the function that initiates
  Ball(float x, float y, int Width, color Color) {
     ballX= x;
     ballY= y;
     ballWidth= Width;
     ballColor= Color; 
  }
   //this draws the ball on the screen
  void draw() {
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballWidth, ballWidth);
  }
  
  
  //this changes the ball to the speed;
  void update() {
    ballX+=speedX;
    ballY+=speedY;
  }
  void move(int X, int Y) {
    ballX=X;
    ballY= Y;
    speedY= 7;
    speedX= 7;
  }
  
  //this does the bounce
  boolean checkWallCollision() {
    if (ballX>width-ballWidth/2) {
        speedX=-abs(speedX); 
    } else if (ballX<ballWidth/2) {
       speedX=abs(speedX);
    } if (ballY>height-ballWidth/2) { 
        speedY=-abs(speedY);
        return true; 
    } else if (ballY<ballWidth/2) {
        speedY= abs(speedY);
    }
    return false;
  }
}