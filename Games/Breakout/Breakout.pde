/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/104486*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//Display window size
int widthD= 400;
int HeightD= 600;
int score=0;
int lives=5;

//Bricks
int spaceBetweenBricks= 5;
int numberOfBricks= 10;
int numberOfBrickRows= 10;
int spaceFromCeiling= 20; //space between the first row of bricks and the ceiling
float brickWidth= (widthD-(numberOfBricks-2)*spaceBetweenBricks)/numberOfBricks;
float brickHeight= 10;
color brickColors[]= {color(255, 0,0), color(125, 125, 0),color(255,125,0),color(0,255,0),color(0,0,255),color(0, 125, 125),color(0,125,255),color(255,125,255),color(255,0,255),color(255,125,125)};
color brickColor= color(255,0,0);
ArrayList<Block> BasketOfBricks= new ArrayList<Block>();

//Ball
int ballWidth= 16;
float ballStartX=random(widthD);
float ballStartY=HeightD/2;
color ballColor= color(255, 0, 0);
color ballColor1= color(0,0,255);
Ball Moe= new Ball(ballStartX, ballStartY, ballWidth, ballColor);
Ball Raisin= new Ball(ballStartX, ballStartY, ballWidth, ballColor1);

//Paddle
int paddleX= widthD/2;
int paddleY= HeightD-50;
int paddleHeight= 20;
int paddleWidth= 70;
color paddleColor= color(255, 0, 255);
Block paddle= new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

void setup() {
  size(400, 600);
  background(255); 
  setupBricks();
}

void draw() {
  if(lives>0){
    background(0,0,0); 
    drawBricks();
    drawBall();
    drawPaddle();
    drawText();
  }
   else if (lives==0){
    background(0,0,0);
    fill(255,0,0);
    displayText("You're a loser",width/4,height/2,false);
  }
  if (BasketOfBricks.size()==0){
    background(0,0,0);
    fill(255,255,0);
    displayText("You're a winner",width/4,height/2,false);
  }
}

//initialize all the bricks
void setupBricks() {
  for(int brickNumber=0; brickNumber<numberOfBricks;brickNumber++){
    rect((brickWidth+spaceBetweenBricks)*brickNumber,spaceFromCeiling,brickWidth,brickHeight);
    for(int rowNumber=0; rowNumber<numberOfBrickRows;rowNumber++){
      color brickColor=(brickColors[rowNumber]);
      BasketOfBricks.add(new Block((brickWidth+spaceBetweenBricks)*brickNumber,((brickHeight+spaceBetweenBricks)*rowNumber)+spaceFromCeiling,brickWidth,brickHeight,brickColor));
    }
  }
}

//draw the bricks
void drawBricks() {
for(int brickNumber= BasketOfBricks.size()-1; brickNumber>=0; brickNumber--) {
    Block brick=BasketOfBricks.get(brickNumber);
    brick.draw();
if (brick.collidesWith(Moe)){
   BasketOfBricks.remove(brick);
   updateScore();
}
  }
}

//draw the ball
void drawBall() {
  Moe.update();
  Moe.draw();
  if (Moe.checkWallCollision()) {
    updateLives();
    Moe.move(width/2,height/2);
  }  
}

//draw the paddle and have it move with the mouse
void drawPaddle() {
  paddle.draw();
  paddle.move(mouseX, paddleY);
  paddle.collidesWith(Moe);
}

//drawText
void drawText() {
  fill(255,125,150);
  displayText("Score:" +score,0,height,false);
  displayText("Lives:" +lives,2*width/3,height,false);
}
void displayText(String message, int x, int y, boolean isCentered) {
  textSize(32);
  String name= message;
  float textX= x;
  if (isCentered) {
    float widthText= textWidth(name);
    textX= (width-widthText)/2;
  } 
  int textY= y;
  text(name, textX, textY);
}
  
void drawLose() {
 
}
  
void updateScore() {
  score=score+10;
}
void updateLives() {
  lives=lives-1;
}