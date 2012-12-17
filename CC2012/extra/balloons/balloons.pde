Balloon balloons;

void setup() {
  size(600,600);
  balloons = new Balloon(width/2, height, 40,40, color(255,0,0));
  smooth();
}


void draw() {
  background(150);
  balloons.updateBalloon();
  balloons.drawBalloon();
}


class Balloon {
  
   //Properties
  int x;
  int y;
  int w;
  int h;
  color c;
  
  //keeps track of balloon state
  boolean popped;
  
  //makes the balloon move side-to-side
  int direction;
  int wallOne;
  int wallTwo;
  
  //Constructor
  //Providing the initial values for the class
  Balloon(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    popped = false;
    
    direction = 1;
    wallOne = this.x - 50;
    wallTwo = this.x + 50;
  }
   
  //Methods
  void updateBalloon() {
    
    if (mousePressed) {
      
      float distance = dist(mouseX, mouseY, this.x, this.y);
      if (distance <= this.w/2 || distance <= this.h/2){
        popped = true;
      } 
      
    }
   
    if(popped == false) {
     
      //moves the balloon up
      this.y-=2;
      
      //checks if it goes above the top of the frame
      if (this.y <= -this.h-1) {
        this.y = height+this.h+1;
      }
      
      if(this.x < wallOne) {
        direction*=-1;
      } else if (this.x > wallTwo) {
        direction*=-1; 
      }
      
      this.x+=2*direction;
     
    } else {
      
      this.y+=2;
      
    }
  
  
    if (popped == true) {
     if (this.y >= height+this.h+1) {
       popped = false;
     }
    }
  
  }
  
  void drawBalloon() {
    
    if(popped == false) {
       fill(this.c);
       ellipse(this.x, this.y, this.w, this.h); 
    } else {
       rectMode(CENTER);
       fill(this.c);
       rect(this.x, this.y, this.w, this.h);
       rectMode(CORNER);
    }
  }
  
}
