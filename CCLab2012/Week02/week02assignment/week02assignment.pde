/**
 * week02assignment 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables
int     radius;
int     radiusTwo;
float	frequency, position, positionAdder;
float	frequencyTwo, positionTwo, positionAdderTwo;
float   posOne, posTwo;
float   posThree, posFour;

float   posY;

float [] xPosRed = new float [400];
float [] yPosRed = new float [400];
float [] redAlpha = new float [400];
float [] xPosGreen = new float [400];
float [] yPosGreen = new float [400];
float [] greenAlpha = new float [400];

float [] starX = new float [20];
float [] starY = new float [20];
float [] starSize = new float [20];
float [] starSpeed = new float [20];

int movementTrail;

void setup() {
  size(800, 800);
  background(0);
  smooth();

  posY = 0;
  
  //Sets the magnitude
  radius        = 100;
  radiusTwo     = 15;

  //Sets rate of motion
  frequency     = 400;
  frequencyTwo  = 3200;
    
  //Provides initial position value
  position      = 0;
  positionTwo   = 0;
  
  //**This is important**
  //This specifies the increment taken for each draw cycle
  //A way to think of this is that we are taking a circle, which is two pi in radians
  //And breaking it up into 44,100 pieces (see http://en.wikipedia.org/wiki/44,100_Hz)
  //Our frequency is then saying how many steps to take around the circle each cycle
  //And positionAdder is that incremental value in radians
  positionAdder = ( (float)frequency / 44100) * TWO_PI;
  positionAdderTwo = ( (float)frequencyTwo / 44100) * TWO_PI;
  
  //for the fuel trail
  movementTrail = 0;
  
  for (int i = 0; i < 400; i++) {
    xPosRed[i] = width;
    yPosRed[i] = height;
    redAlpha[i] = 150;
    xPosGreen[i] = width;
    yPosGreen[i] = height;
    greenAlpha[i] = 150;
  }

  for (int i = 0; i < 20; i++) {
   starX[i] = -width - i*(random(15,30));
   starY[i] = random(0, height);
   starSize[i] = random(2, 10);
   starSpeed[i] = random(1, 6);
  }


}

void draw() {

  noStroke();
  
  stars();
  
  if (movementTrail < 400) {  movementTrail++; }
  
  //This simulates a "tail" on the end of the moving object
  //by using the alpha channel of a rect instead of a backgroud
  //Change the alpha value of fill to see what happens
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  
  if (keyPressed == true) {
    if(key == CODED) {
      if (keyCode == UP) {
        if (posY > -height/2) { posY-=2;}
      }
      if (keyCode == DOWN) {
        if (posY < height/2) { posY+=2;}    
    }
  }
  }
  
  // Move the origin to the center of screen
  translate(width/2, height/2);

  //Increment the position of the object
  position += positionAdder;
  positionTwo += positionAdderTwo;

  posOne = oscillationPositive(position, radius);
  posTwo = oscillationNegative(position, radius);
  posThree = oscillationPositive(positionTwo, radiusTwo);
  posFour = oscillationNegative(positionTwo, radiusTwo);

  // This is the red and circle and arc connector
  noFill();
  stroke(255, 0, 0, 150);
  strokeWeight(4);
  arc(0, posY, 400, posTwo*2, PI, TWO_PI-(PI/2.0));
  arc(0, posY, 400, posOne*2, PI/2.0, PI);

  noStroke();
  fill(255, 0, 0, 150);
  ellipse(0, posOne+posY, 20, 20);
  
    // This is the green circle and arc connector
  noFill();
  stroke(0, 255, 0, 150);
  arc(0, posY, 400, posTwo*2, PI/2.0, PI);
  arc(0, posY, 400, posOne*2, PI, TWO_PI-(PI/2.0));
  noStroke();
  fill(0, 255, 0, 150);
  ellipse(0, posTwo+posY, 20, 20);
  
  
  
  //These represent the fuel trail of the rocket
  for (int i = 0; i < movementTrail; i++) {
    if (xPosRed[i] < width/2-2) {
      xPosRed[i]+=2;
      if(redAlpha[i] > 0) { redAlpha[i]+= -1; }
    } else {
      xPosRed[i] = 0;
      yPosRed[i] = posOne+posY;
      redAlpha[i] = 150;
    }
    fill(155, 0, 0, redAlpha[i]);
    ellipse(xPosRed[i], yPosRed[i], 20, 20);

    if (xPosGreen[i] < width/2-2) {
      xPosGreen[i]+=2;
      if(greenAlpha[i] > 0) { greenAlpha[i]+= -1; }
    } else {
      xPosGreen[i] = 0;
      yPosGreen[i] = posTwo+posY;
      greenAlpha[i] = 150;
    }
    fill(0, 155, 0, greenAlpha[i]);
    ellipse(xPosGreen[i], yPosGreen[i], 20, 20);

  }

  shipFront();

}

void stars() {
 
 for (int i = 0; i<20; i++) { 
   if (  starX[i] < width ) { starX[i] += starSpeed[i]; }
   else { 
     starSize[i] = random(2, 10);
     starSpeed[i] = random(1, 6);
     starY[i] = random(0, height);
     starX[i] = -width - starSize[i];
   }
  
   fill(255, 155);
   ellipse(starX[i], starY[i], starSize[i], starSize[i]);
  }
}

//front of the ship
void shipFront() {
   //rotating all objects 90 degrees (or PI/2.0) that follow this function
  //for info on translate, rotation, etc. check this out: http://processing.org/learning/transform2d/
  translate(-radius*2.0, posY);
  rotate(PI/4.0);
  noFill();
  stroke(0, 0, 255, 150);
  strokeWeight(2);
  ellipse(0, posThree, 20, 20);
  ellipse(0, posFour, 20, 20);

  rotate(PI/4.0);
  ellipse(0, posThree, 20, 20);
  ellipse(0, posFour, 20, 20);

  rotate(PI/4.0);
  ellipse(0, posThree, 20, 20);
  ellipse(0, posFour, 20, 20);

  rotate(PI/4.0);
  ellipse(0, posThree, 20, 20);
  ellipse(0, posFour, 20, 20);
}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float thePosition, int theRadius) {

  float pos = sin(thePosition);
  pos = pos * theRadius;

  //this is to keep the variable position at or under Two Pi
  while (thePosition > TWO_PI) { thePosition -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float thePosition, int theRadius) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(thePosition-PI);
  pos = pos * theRadius;
  
  //this is to keep the variable position at or under Two Pi
  while (thePosition > TWO_PI) { thePosition -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

