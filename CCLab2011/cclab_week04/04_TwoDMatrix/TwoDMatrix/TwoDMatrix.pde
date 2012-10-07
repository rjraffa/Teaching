/*
 * TwoDMatrix
 * Based on code from Dong Yoon Park
 * http://www.cre8ive.kr/blog/
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/19/11
 */

// you don't need to import openGL here for this sketch
// but you will need it for the in-class exercise
import processing.opengl.*;

void setup() {
  // include "OPENGL" when using the library
  size(600,600,OPENGL);
  smooth();
}

void draw() {
  background(0);
  noFill();
  stroke(0,255,0);
  
  
  translate(0, 0, -mouseX);  
  
  // here we are creating a 2D matrix
  for(int i=1 ; i<20 ; i=i+2) {
    for(int j=1 ; j<20 ; j=j+2) {
        rect(i*30, j*30, 20, 20);
    }
  }
}
