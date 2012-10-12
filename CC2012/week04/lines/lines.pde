/*
 * Lines
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/20/12
 */

int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

void setup() {
 
 size(600,600);
 background(255);
 
 xOne = -100;
 yOne = -100;

 xTwo = -100;
 yTwo = 100;

 xThree = 100;
 yThree = -100;

 xFour = 100;
 yFour = 100;
 
}

void draw() {
 translate(width/2,height/2);
  
 line(xOne,yOne, xFour, yFour);
 line(xTwo,yTwo, xThree,yThree);
  
}
