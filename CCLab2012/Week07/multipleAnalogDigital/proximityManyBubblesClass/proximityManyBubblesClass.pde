/*
 * Proximity Bubbles Many
 * with Arduino
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 10/8/12
 */

import processing.serial.*;
Serial myPort;        // The serial port

Bubble [] bubbleArray = new Bubble[100];

int [] myAnalogValue = new int [6];
int [] myDigitalValue = new int [5];

float maxFrameSize;
float posX;
float posY;

void setup() {
  size(800,800);

  noStroke();

  //largest distance between 0,0 and width,height
  maxFrameSize = dist(0,0,width,height);

  for (int i = 0; i < bubbleArray.length; i++) {
      bubbleArray[i] = new Bubble(random(20,width-20),random(20,height-20),0,0,color(0,0,0,40), color(255,0,0,40));
  }
  
  //these values will be set with incoming values from Arduino
  posX = 0.0;
  posY = 0.0;
  
  // List all the available serial ports
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  
}

void draw() {
  background(0);
  
  // 2 potentiometers on the analog value pins A0 and A1
  posX = map(myAnalogValue[0], 0, 1023, 0, width); // analog pin 0
  posY = map(myAnalogValue[1], 0, 1023, 0, height); //analog pin 1
  
  //or use 4 digital pins to control the movement
//  if (myDigitalValue[0] == 1) posY-=5; //digital pin 2
//  if (myDigitalValue[1] == 1) posY+=5; //digital pin 3
//  if (myDigitalValue[2] == 1) posX-=5; //digital pin 4
//  if (myDigitalValue[3] == 1) posX+=5; //digital pin 5
      
  if (posX <= 0) posX = 0;
  if (posX >= width) posX = width;
  
  if (posY <= 0) posY = 0;
  if (posY >= height) posY = height;
  
  fill(255);
  ellipse(posX, posY, 10,10);
  
  for (int i = 0; i < bubbleArray.length; i++) {
      bubbleArray[i].updateBubble(maxFrameSize, posX, posY);
      bubbleArray[i].drawBubble();
  }
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
      
      println("posX " + posX);
      println("posY " + posY);

      myPort.write("r");
 }
