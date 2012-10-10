/*
 * Comets
 * To show rotations on XY and Z axis
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 10/05/12
 */
 
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;

PImage psy;

float deg, degTwo, degThree;
float radOne, radTwo, radThree;

void setup() {
 
 size(800,800, P3D);
 
 xOne = -100;
 yOne = 0;

 xTwo = 0;
 yTwo = -100;

 xThree = 100;
 yThree = 0;
 
 deg = 0.0;
 degTwo = 90.0;
 
 psy = loadImage("PSY1.png");
 
}

void draw() {
 background(255);
 
 rectMode(CENTER);
 translate(width/2,height/2);

 //red lines
 pushMatrix();
 
 fill(0);
 ellipse(0,0,50,50);
 
 //red square
 deg+=2;
 if(deg > 360) deg = 0.0;
 radOne = radians(deg);
 rotateY(radOne);
 fill(255,0,0);
 rect(xOne, yOne, 50, 50);

   //psy face
   translate(xThree, yThree); 
   pushMatrix();
   degTwo += 1/3;
   if(degTwo > 360) degTwo = 0.0;
   radTwo = radians(degTwo);
   rotateY(radTwo);
   image(psy, -50,-50);
   popMatrix();
 
 popMatrix();

 //green circle
 pushMatrix(); 
 degThree-=4;

 radThree = radians(degThree);
 rotate(radThree);
 fill(0,255,0);
 ellipse(xTwo*2, yTwo*2, 50, 50);
 popMatrix();
  
}
