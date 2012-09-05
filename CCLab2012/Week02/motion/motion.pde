/**
 * Motion 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/02/12
 */

//create initial global variables
int     radius;
float	frequency, position, positionAdder;
float   posOne, posTwo;

void setup() {
  size(800, 800);
  background(255);
  smooth();

  //Sets the magnitude
  radius        = 300;

  //Sets rate of motion
  frequency     = 200;
  
  //Provides initial position value
  position      = 0;

  //**This is important**
  //This specifies the increment taken for each draw cycle
  //A way to think of this is that we are taking a circle, which is two pi in radians
  //And breaking it up into 44,100 pieces (see http://en.wikipedia.org/wiki/44,100_Hz)
  //Our frequency is then saying how many steps to take around the circle each cycle
  //And positionAdder is that incremental value in radians
  positionAdder = ( (float)frequency / 44100) * TWO_PI;
}

void draw() {

  noStroke();
  
  //This simulates a "tail" on the end of the moving object
  //by using the alpha channel of a rect instead of a backgroud
  //Change the alpha value of fill to see what happens
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);

  // Move the origin to the center of screen
  translate(width/2, height/2);

  //Increment the position of the object
  position += positionAdder;

  // Red Circle
  fill(255, 0, 0);
  posOne = oscillationPositive(position);
  ellipse(0, posOne, 20, 20);

  // Green
  fill(0, 255, 0);
  posTwo = oscillationNegative(position);
  ellipse(0, posTwo, 20, 20);

  //rotating all objects 90 degrees (or PI/2.0) that follow this function
  //for info on translate, rotation, etc. check this out: http://processing.org/learning/transform2d/
  rotate(PI/2.0);
  fill(0, 0, 255);
  ellipse(0, posOne, 20, 20);
  noFill();
  stroke(0, 0, 255);
  ellipse(0, posTwo, 20, 20);

}

//Instead of creating a function that is void (ie returns nothing)
//Here are two functions that return a float value

float oscillationPositive(float position) {

  float pos = sin(position);
  pos = pos * radius;

  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

float oscillationNegative(float position) {

  //Subtract PI to provide a value on the opposite side in radians
  float pos = sin(position-PI);
  pos = pos * radius;
  
  //this is to keep the variable position at or under Two Pi
  while (position > TWO_PI) { position -= TWO_PI; }

  //this tells the function what value to return
  return pos;
}

