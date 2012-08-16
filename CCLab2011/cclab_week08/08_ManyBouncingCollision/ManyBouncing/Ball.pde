class Ball {

  // Properties
  float x;
  float y;
  float w;
  float h;
  float r; //radius
  
  float m; //mass
  
  color c;
  PVector vels = new PVector (random(-5.00, 5.00), random(-5.00, 5.00));

  PVector tempVal;
  PVector finalVal;


  // Constructor
  Ball(int x, int y, int w, int h, color c, int s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.r = w*.5;
    
    this.m = r*.1;
    
    this.c = c;


  }

  // Methods
  void drawBall() {
    fill(this.c);
    ellipse( this.x, this.y, this.w, this.h);
  }

  void updatePositionWall() {
    if ((this.x > width-this.r)
      || (this.x < this.r)) {
      this.vels.x *= -1;
    }

    if ((this.y > height-this.r)
      || (this.y < this.r)) {
      this.vels.y *= -1;
    }

    this.x += this.vels.x;
    this.y += this.vels.y;
  }

}

