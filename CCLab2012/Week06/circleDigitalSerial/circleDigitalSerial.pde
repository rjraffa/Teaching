/*
 * Circle Digital Serial
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 9/10/12
 */

import processing.serial.*;

Serial myPort;        // The serial port

boolean buttonPush;

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  // List all the available serial ports
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

}

void draw() {
  
     background(0);
     
    if (buttonPush == true) {
      fill (255, 0, 0, 255);
      ellipse(width*.5, height*.5, 200,200);     
   } else {
      fill (255, 0, 0, 50);
      ellipse(width*.5, height*.5, 200,200);
   }
  
}

 void serialEvent (Serial myPort) {
   // get the ASCII string:
   String inString = myPort.readStringUntil('\n');
   println (inString);
   
   if (inString != null) {
     // trim off any whitespace:
     inString = trim(inString);
     // convert to an int and map to the screen height:
     float inByte = float(inString); 

     if (inByte == 1) {
       buttonPush = true; 
     } else {
       buttonPush = false;
     }
     
   }

 }
