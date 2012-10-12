/*
 * Droplet
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/27/12
 */

import ddf.minim.*;

int circleWidth;
int circleHeight;

int posX;
int posY;

boolean drawDroplet;

Minim minim;
AudioPlayer  waterDrop;

void setup() {
  size(500, 500);
  background(0);
  noStroke();

  circleWidth = 0;
  circleHeight = 0;
  
  posX = 0;
  posY = 0;

  drawDroplet = false;

  minim = new Minim(this);
  // load the sound files
  waterDrop = minim.loadFile("water-droplet-1.mp3", 2048);
  
}

void draw() {

  fill(0,150);
  rect(0,0,width,height);
  
  if (drawDroplet == true) {
     fill(255);
     circleWidth+=2;
     circleHeight+=2;
  }

  if (circleWidth > 1000 || circleHeight > 1000) {
     drawDroplet = false; 
  }

  ellipse(posX, posY, circleWidth, circleHeight);

}

void mousePressed() {

   posX = mouseX;
   posY = mouseY;
   circleWidth = 0;
   circleHeight = 0;
  
   waterDrop.play(0);
   drawDroplet = true;
   
}

void stop() {
  // always close Minim audio classes when you are done with them
  waterDrop.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
