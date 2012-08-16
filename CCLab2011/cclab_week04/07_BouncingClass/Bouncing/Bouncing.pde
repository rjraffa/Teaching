Ball ball1;

void setup() {
  size(800,600);
  background(0);
  smooth();
  noStroke();
  ball1 = new Ball(200,200,50,50,color(0,255,0), 10);
}

void draw() {

  // use the alpha channel of rect to produce trail on bouncing ball
  fill(0,0,0,10);
  rect(0,0,width,height);

  ball1.updatePosition();
  ball1.drawBall();
}
