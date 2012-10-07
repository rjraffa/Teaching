/*
 * Wheels
 *
 * CC Lab Fall 2011
s * by Ryan Raffa
 * 9/19/11
 */

// Creating instances of our object called "Thingy"
Thingy myThingy1;
Thingy myThingy2;
Thingy myThingy3;

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  myThingy1 = new Thingy(10,10,50,50,color(255,0,0,130));
  myThingy2 = new Thingy(10,10,50,50,color(0,255,0,130));
  myThingy3 = new Thingy(10,10,50,50,color(0,0,255,130));
}

void draw() {
  background(0);
  myThingy1.drawThingy(150,150);
  myThingy2.drawThingy(300,300);
  myThingy3.drawThingy(450,450);
}
