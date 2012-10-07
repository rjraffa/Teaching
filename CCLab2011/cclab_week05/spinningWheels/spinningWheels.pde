/*
 * Spinning Wheels
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/10/11
 */

// Creating instances of our object called "Thingy"
Thingy myThingy1, myThingy2, myThingy3;

float position1, position2, position3;

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  myThingy1 = new Thingy(10,10,50,50,color(255,0,0,130));
  myThingy2 = new Thingy(10,10,50,50,color(0,255,0,130));
  myThingy3 = new Thingy(10,10,50,50,color(0,0,255,130));
  
  // determines position of the different thingys
  position1 = 150;
  position2 = 300;
  position3 = 450;

}

void draw() {
  background(0);
  
  myThingy1.updateThingy(position1,position1);
  myThingy2.updateThingy(position2,position2);
  myThingy3.updateThingy(position3,position3);
  
  myThingy1.drawThingy(position1,position1);
  myThingy2.drawThingy(position2,position2);
  myThingy3.drawThingy(position3,position3);
}
