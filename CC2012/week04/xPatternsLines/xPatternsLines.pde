/*
 * xPatternsLines
 * Lines with for loops
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
 
 background(255);
 size(600,600);
 smooth();
 strokeWeight(10);
 
 xOne = -10;
 yOne = -10;

 xTwo = -10;
 yTwo = 10;

 xThree = 10;
 yThree = -10;

 xFour = 10;
 yFour = 10;
 
 deg = 0.0;
 
}

void draw() {
 //Uncomment background and rotation to see what happens
 //background(255);
 translate(width/2,height/2);
 
// deg+=2;
// float rad = radians(deg);
// rotate(rad);
  
 for (int i = 0; i < 20; i++) {
  
   stroke(255,0,0);
   line(xOne*i,yOne*i,xTwo*i,yTwo*i);
   line(xThree*i,yThree*i,xFour*i,yFour*i);

   rotate(PI/2);

   stroke(0,0,255);
   line(xOne*i,yOne*i,xTwo*i,yTwo*i);
   line(xThree*i,yThree*i,xFour*i,yFour*i);
   
 }
 
  
}
