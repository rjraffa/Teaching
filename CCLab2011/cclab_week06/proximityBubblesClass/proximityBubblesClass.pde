/*
 * Proximity Bubbles Class
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/7/11
 */

/* Proximity Bubbles */
Bubble bubbleOne, bubbleTwo, bubbleThree;
float maxFrameSize;

void setup() {
  size(1700,1000);

  noStroke();

  //largest distance between 0,0 and width,height
  maxFrameSize = dist(0,0,width,height);
  
  bubbleOne = new Bubble(200,200,0,0,color(0,0,0,40), color(255,0,0,40)); 
  bubbleTwo = new Bubble(400,400,0,0,color(0,0,0,40), color(255,0,0,40)); 
  bubbleThree = new Bubble(600,600,0,0,color(0,0,0,40), color(255,0,0,40)); 
}

void draw() {
  background(0);

  bubbleOne.updateBubble(maxFrameSize);
  bubbleOne.drawBubble();
  
  bubbleTwo.updateBubble(maxFrameSize);
  bubbleTwo.drawBubble();

  bubbleThree.updateBubble(maxFrameSize);
  bubbleThree.drawBubble();
}
