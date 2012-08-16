// Declare an array which can contain 100 instances of the Ball class
Ball[] ballArray = new Ball[100];

void setup() {
  size(800,600);
  background(0);
  smooth();
  noStroke();

  // Create instances of Ball class - Allocates memory for the objects
  for(int i=0 ; i<ballArray.length ; i++) {
    int ballSize = int(random(5,50));
    ballArray[i] = new Ball(int(random(50,700)),int(random(50,500)),
    ballSize,ballSize,
    color(random(255),random(255),random(255)), 10);
    }
  }

void draw() {
  // uncomment background to remove trails
  //background(0);
  fill(0,0,0,10);
  rect(0,0,width,height);
  
  for(int i=0 ; i<ballArray.length ; i++) {
    ballArray[i].updatePosition();
    ballArray[i].drawBall();
  }
  float myXPosition = ballArray[0].ballPosX;
  println("Ball Number One "+ myXPosition);
  println("Ball Number Two "+ballArray[0].ballPosX);
}
