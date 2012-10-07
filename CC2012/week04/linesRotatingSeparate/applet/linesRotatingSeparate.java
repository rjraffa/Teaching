import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class linesRotatingSeparate extends PApplet {

/*
 * Lines Rotating Separate
 * To show rotations at different speeds
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 09/20/12
 */
 
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;

float deg, degTwo, degThree;

public void setup() {
 
 size(1200,400);
 
 xOne = -100;
 yOne = -100;

 xTwo = -100;
 yTwo = 100;

 xThree = 100;
 yThree = -100;

 xFour = 100;
 yFour = 100;
 
 deg = 0.0f;
 degTwo = 0.0f;
 degThree = 0.0f;
 
}

public void draw() {
 background(255);

 //red lines
 pushMatrix();
 translate(300,height/2);

 deg+=2;
 float rad = radians(deg);
 rotate(rad);

 stroke(255,0,0);
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);
 popMatrix();

 //green lines
 pushMatrix();
 translate(width/2,height/2);
 
 degTwo+=6;
 float radTwo = radians(degTwo);
 rotate(radTwo);

 stroke(0,255,0);
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);
 popMatrix();

 //blue lines
 pushMatrix();
 translate(900,height/2); 
 
 degThree+=10;
 float radThree = radians(degThree);
 rotate(radThree);
 
 stroke(0,0,255);
 line(xOne, yOne, xFour, yFour);
 line(xTwo, yTwo, xThree, yThree);
 popMatrix();
  
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "linesRotatingSeparate" });
  }
}
