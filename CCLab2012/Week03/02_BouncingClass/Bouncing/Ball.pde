class Ball {
  
  // Properties
  int x;
  int y;
  int w;
  int h;
  color c;
  int xSpeed = 5;
  int ySpeed = 5;

  // Constructor
  Ball(int x,int y,int w,int h, color c, int s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;

    this.xSpeed = s;
    this.ySpeed = s;
    //or for shorthand, you can do this...
    // this.xSpeed = this.ySpeed = s;
  }

  // Methods
  void drawBall() {
    fill(this.c);
    ellipse( this.x, this.y,this.w, this.h);
  }
  
  void updatePosition() {
    if((this.x > width-this.w/2)
    || (this.x < this.w/2)) {
      this.xSpeed = -this.xSpeed;
    }

    if((this.y > height-this.h/2)
    || (this.y < this.h/2)) {
      this.ySpeed = -this.ySpeed;
    }
    
    this.x += this.xSpeed;
    this.y += this.ySpeed;
  }
}
