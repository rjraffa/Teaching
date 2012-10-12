/*
 * Comets
 * To show rotations on XY and Z axis
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/05/12
 */
 
PVector posOne, posTwo, posThree;

PImage psy;

float [] deg = new float[3];
float [] rad = new float[3];

void setup() {
 
 size(800,800, P3D);
 posOne = new PVector(-100, 0);
 posTwo = new PVector(0, -100);
 posThree = new PVector(100, 0); 
 
 deg[0] = 0.0;
 deg[1] = 90.0;
 
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
 deg[0]+=2;
 if(deg[0] > 360) deg[0] = 0.0;
 rad[0] = radians(deg[0]);
 rotateY(rad[0]);
 fill(255,0,0);
 rect(posOne.x, posOne.y, 50, 50);

   //psy face
   translate(posThree.x, posThree.y); 
   pushMatrix();
   deg[1] += 1/3;
   if(deg[1] > 360) deg[1] = 0.0;
   rad[1] = radians(deg[1]);
   rotateY(rad[1]);
   image(psy, -50,-50);
   popMatrix();
 
 popMatrix();

 //green circle
 pushMatrix(); 
 deg[2]-=4;

 rad[2] = radians(deg[2]);
 rotate(rad[2]);
 fill(0,255,0);
 ellipse(posTwo.x*2, posTwo.y*2, 50, 50);
 popMatrix();
  
}
