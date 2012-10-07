/*
 * Spinning Wheels Digital Serial
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/10/11
 */
 
import processing.serial.*;

Thingy myThingy1;     // Creating instances of our object called "Thingy"

Serial myPort;        // The serial port
float position1, position2, position3;
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

  myThingy1 = new Thingy(50,50,150,color(255,0,0,130));
  
  // determines position of the thingy
  position1 = 300;

}

void draw() {
  
     background(0);

    //update thingy
    myThingy1.updateThingy(position1,position1,buttonPush);  

    //draw thingy
    myThingy1.drawThingy(position1,position1);

  
}

 void serialEvent (Serial myPort) {
   // get the ASCII string:
   String inString = myPort.readStringUntil('\n');
   
   if (inString != null) {
     // trim off any whitespace
     inString = trim(inString);
     // convert to an int
     float inByte = float(inString); 

       if (inByte == 1) {
         buttonPush = true; 
       } else {
         buttonPush = false;
       }     
   }

 }
