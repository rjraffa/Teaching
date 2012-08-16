class Ball {

  // Properties
  int ballPosX;
  int ballPosY;
  int ballWidth;
  int ballHeight;
  color ballColor;
  
  // Constructor
  // Constructor is used for intializing data for the object
  // when it is created
  Ball(int x,int y,int w,int h,color c) {
    this.ballPosX = x;
    this.ballPosY = y;
    this.ballWidth = w;
    this.ballHeight = h;
    this.ballColor = c;
  }
  
  // Method
  void drawBall() {
  fill(this.ballColor);
  ellipse( this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }

}
