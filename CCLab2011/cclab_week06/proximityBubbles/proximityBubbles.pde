/*
 * Proximity Bubbles
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/3/11
 */

/* Proximity Bubbles */

float bubbleOneX;
float bubbleOneY;

float bubbleTwoX;
float bubbleTwoY;

float bubbleThreeX;
float bubbleThreeY;

float maxFrameSize;

void setup() {
  size(600,600);
  noStroke();
  
  //largest distance between 0,0 and width,height
  maxFrameSize = dist(0,0,width,height);


  bubbleOneX = 150;
  bubbleOneY = 150;
  
  bubbleTwoX = 300;
  bubbleTwoY = 300;
  
  bubbleThreeX = 450;
  bubbleThreeY = 450;
  
}

void draw() {
  background(255);
  
  float valueOfRed = map(mouseX, 0, width, 0, 255);
  drawPoints(valueOfRed);
  
}


void drawPoints (float redValue) {
 fill(redValue, 0,0,30);

 float distOne = dist(mouseX, mouseY, bubbleOneX, bubbleOneY);
 float diameterOne = map(distOne, 0, maxFrameSize, 200, 0);
 ellipse(bubbleOneX, bubbleOneY, diameterOne, diameterOne);
 
 float distTwo = dist(mouseX, mouseY, bubbleTwoX, bubbleTwoY);
 float diameterTwo = map(distTwo, 0, maxFrameSize, 200, 0);
 ellipse(bubbleTwoX, bubbleTwoY, diameterTwo, diameterTwo);
 
 float distThree = dist(mouseX, mouseY, bubbleThreeX, bubbleThreeY);
 float diameterThree = map(distThree, 0, maxFrameSize, 200, 0);
 ellipse(bubbleThreeX, bubbleThreeY, diameterThree, diameterThree);
 
 println(distOne);
  
}
