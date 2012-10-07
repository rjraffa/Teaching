/*
 * My First Class
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/19/11
 */

Ball myBall1;
Ball myBall2;

void setup() {
  size(800,600);
  background(0);
  smooth();
  noStroke();

  myBall1 = new Ball(100,100,50,50,color(255,0,0));
  myBall2 = new Ball(200,200,75,75,color(0,255,0));

}

void draw() {
  myBall1.drawBall();
  myBall2.drawBall();
}
