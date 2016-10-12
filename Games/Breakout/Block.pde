/*******Block Class**************/
/* The default class has the following default modes
 * Constructor function: to create a new block call:
               Block blockName= new Block(x, y, Width, Height, Color);
 * blockName.draw();  //this draws the ball
 * blockName.move(x, y); //this moves the block to be centered on X and Y
 * blockName.collidesWith(Ball b); //checks if it collided with the ball 
 *                                 //and makes the ball bounce
 * blockName.setHits(int numberOfHits); //allows you to set the number of times a brick needs to hit
 * blockName.getHIts(int numberOfHits); //tells you how times left the brick can be hit
 */
class Block {
  float blockX;
  float blockY;
  float blockWidth;
  float blockHeight;
  color blockColor;
  int maxHits= 1;
  int hits=maxHits;
  
  //This is constructor known as the function that initiates
  Block(float x, float y, float Width, float Height, color Color) {
     blockX= x;
     blockY= y;
     blockWidth= Width;
     blockHeight= Height;
     blockColor= Color; 
  }
   //this draws the block on the screen
  void draw() {
    noStroke();
    fill(blockColor);
    rect(blockX, blockY, blockWidth, blockHeight);
  }
  
  
  //this moves the block 
  //to be centered on X, Y coordinates
  void move(int X, int Y) {
    blockX=X-blockWidth/2;
    blockY=Y-blockHeight/2;
    
    //prevents it from going off screen on the X direction
    if (blockX+blockWidth>width) {
      blockX=width-blockWidth;
    }
    else if (blockX<0) {
      blockX=0;
    }
    
    //prevents it from going off screen on the the Y direction
    if (blockY+blockHeight>height) {
      blockY=height-blockWidth;
    }
    else if (blockY<0) {
      blockY=0;
    }
    
  }
  
  //allows you to change the number of times an individual block can be hit
  void setMaxHits(int numberOfHits) {
    maxHits=numberOfHits;
    hits= maxHits;
  }
  
  //tells you if the brick can be hit more
  //returns 0 if the brick needs to be removed
  //useful if you want the brick hit multiple times
  int getHits() {
   return hits;
  }
  
  //returns a boolean if it collides with a ball.
 // It automatically changes the speed of the ball
  boolean collidesWith(Ball b) {
    //collides with bottom of block
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
        && (b.ballY-b.ballWidth/2<(blockY+blockHeight) && b.ballY-ballWidth/2>blockY)) {
        //println("Collision Bottom 2 ");
        b.speedY=abs(b.speedY);
        hits--;
        return true;
      }
    
    //collides with top of block
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
      && (b.ballY+b.ballWidth/2<blockY+blockHeight && b.ballY+b.ballWidth/2>blockY)) {
        //println("Collision Top ");
        b.speedY=-abs(b.speedY);
        hits--;
        return true;
      }
      
     //collides with Left side of block
    else if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX+b.ballWidth/2>blockX && b.ballX+b.ballWidth/2<blockX+blockWidth)) {
        //println("Collision Left ");
        b.speedX=-abs(b.speedX);
        hits--;
        return true;
      }
 
    //collides with Right side of block
   if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX-b.ballWidth/2<blockX+blockWidth && b.ballX-b.ballWidth/2>blockX)) {
        //println("Collision Right");
        b.speedX=abs(b.speedX);
        hits--;
        return true;
      }
  return false;
  }
}