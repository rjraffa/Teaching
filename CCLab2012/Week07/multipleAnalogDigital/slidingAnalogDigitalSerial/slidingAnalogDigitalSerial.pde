/*
 * Sliding Analog Digital Serial
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/19/11
 */

import processing.serial.*;
Serial myPort;        // The serial port

float sensorValue;

float circleWidth;
float circleHeight;

int [] myAnalogValue = new int [6];
int [] myDigitalValue = new int [5];


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
     
     if(myDigitalValue[0] == 1) {
      fill (255, 0, 0, 255);
     } else {
       fill(255, 0, 0, 120);
     }
      ellipse(myAnalogValue[0], myAnalogValue[1], circleWidth,circleHeight);
  
}

 void serialEvent (Serial myPort) {
   // get the ASCII string:
   String inString = myPort.readStringUntil('\n');
   println (inString);
   
     // split up the incoming string:
     int myValueString[] = int(split(inString, ","));


     // convert to a float and pass to analog and digital arrays:
    if (myValueString.length > 10) {
       for (int i = 0; i < 6; i++) {
         myAnalogValue[i] = myValueString[i]; }
       
       for (int i = 0; i < 5; i++) {
         myDigitalValue[i] = myValueString[i+6]; }     
         
       }
    
      println("ValueAnalogPin0 "+ myAnalogValue[0]);
      println("ValueAnalogPin1 "+ myAnalogValue[1]);
      println("ValueAnalogPin2 "+ myAnalogValue[2]);
      println("ValueAnalogPin3 "+ myAnalogValue[3]);
      println("ValueAnalogPin4 "+ myAnalogValue[4]);
      println("ValueAnalogPin5 "+ myAnalogValue[5]);
  
      println("ValueDigitalPin2 "+ myDigitalValue[0]);
      println("ValueDigitalPin3 "+ myDigitalValue[1]);
      println("ValueDigitalPin4 "+ myDigitalValue[2]);
      println("ValueDigitalPin5 "+ myDigitalValue[3]);
      println("ValueDigitalPin6 "+ myDigitalValue[4]);

      myPort.write("r");
    }
