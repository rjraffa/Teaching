// Declare an array which can contain 100 instances of the Ball class
Ball[] ballArray = new Ball[2];

void setup() {
  size(300,300);
  background(0);
  smooth();
  noStroke();

  // Create instances of Ball class - Allocates memory for the objects
  for(int i=0 ; i<ballArray.length ; i++) {
    int ballSize = int(random(20,50));
    ballArray[i] = new Ball(int(random(50,700)),int(random(50,500)),
    ballSize,ballSize,
    color(random(255),random(255),random(255)), 5);
    }
  }

void draw() {
  // uncomment background to remove trails
  background(0);
  fill(0,0,0,10);
  rect(0,0,width,height);
  
  for(int i=0 ; i<ballArray.length ; i++) {
    for(int j=i+1; j< ballArray.length; j++){
      testCollision(ballArray[i], ballArray[j]);
    }
     ballArray[i].updatePositionWall();
     ballArray[i].drawBall();
  }
}


