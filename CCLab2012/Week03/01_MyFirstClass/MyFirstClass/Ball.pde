class Ball {

  // Properties
  int x;
  int y;
  int w;
  int h;
  color c;
  
  // Constructor
  // Constructor is used for intializing data for the object
  // when it is created
  Ball(int _x,int y,int w,int h,color c) {
    x = _x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  // Method
  void drawBall() {
  fill(this.c);
  ellipse( this.x, this.y, this.w, this.h);
  }

}
