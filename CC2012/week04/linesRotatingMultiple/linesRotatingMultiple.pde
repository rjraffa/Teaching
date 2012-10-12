/*
 * Lines Rotating Multiple
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/20/12
 */

int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg;

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
 
 deg = 0.0;
 
}

void draw() {
 //comment out the background to see what happens
 background(255);

 translate(width/2,height/2);

 deg+=4;
 float rad = radians(deg);
 rotate(rad);

 //Center 
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);

 //next two lines
 translate(100,100);
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);

 //next two lines
 translate(100,100); 
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);
  
}
