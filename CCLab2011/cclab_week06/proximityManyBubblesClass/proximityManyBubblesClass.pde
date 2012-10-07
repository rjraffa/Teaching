/*
 * Proximity Bubbles Many
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/7/11
 */

/* Proximity Many Bubbles */
Bubble [] bubbleArray = new Bubble[100];

float maxFrameSize;

void setup() {
  size(1700,1000);

  noStroke();

  //largest distance between 0,0 and width,height
  maxFrameSize = dist(0,0,width,height);

  for (int i = 0; i < bubbleArray.length; i++) {
      bubbleArray[i] = new Bubble(random(0,width),random(0,height),0,0,color(0,0,0,40), color(255,0,0,40));
  }
  
}

void draw() {
  background(0);

  for (int i = 0; i < bubbleArray.length; i++) {
      bubbleArray[i].updateBubble(maxFrameSize);
      bubbleArray[i].drawBubble();
  }
}
