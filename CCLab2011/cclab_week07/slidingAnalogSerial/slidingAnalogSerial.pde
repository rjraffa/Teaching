/*
 * Sliding Analog Serial
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/10/11
 */

import processing.serial.*;

Serial myPort;        // The serial port

float sensorValue;

float circleWidth;
float circleHeight;

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  //setting the size of the circle
  circleWidth = 200;
  circleHeight = circleWidth;
  
  // List all the available serial ports
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

}

void draw() {
  
     background(0);
     
      fill (255, 0, 0, 255);
      ellipse(sensorValue, height*.5, circleWidth,circleHeight);     
  
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

    sensorValue = map(inByte, 22, 1023, circleWidth*.5, width-circleWidth*.5);
     
   }

 }
