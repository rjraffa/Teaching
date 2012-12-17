/*
 * Circle Analog Serial
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 9/10/12
 */

import processing.serial.*;

Serial myPort;        // The serial port

float sensorValue;

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
     
      fill (255, 0, 0, 255);
      ellipse(width*.5, height*.5, sensorValue,sensorValue);     
  
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

    sensorValue = map(inByte, 22, 1023, 10, 300);
     
   }

 }
