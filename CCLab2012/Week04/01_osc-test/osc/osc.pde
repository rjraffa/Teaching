/**
 * oscTest
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/17/12
 */
 
import oscP5.*;
import netP5.*;

OscP5 oscP5;

String myMessage;
int myColor;

int [] myButton = new int [12];

void setup() {
  size(500,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this,8000);
  myColor = 0;
}

void draw() {
  background(myColor);
 
 if (myButton[0] == 1) {
   myColor = 255;
 } else {
   myColor = 0;
 }

  for (int i = 1; i < 4; i++) {
    buttonOnScreenRed(i*100, 50, 100, 100, i);
  }

  for (int i = 4; i < 7; i++) {
    buttonOnScreenGreen((i-3)*100, 150, 100, 100, i);
  }
  
    for (int i = 7; i < 10; i++) {
    buttonOnScreenBlue((i-6)*100, 250, 100, 100, i);
  }
}

// The following functions draw my boxes on screen
void buttonOnScreenRed(int x, int y, int w, int h, int toggleValue){
   if (myButton [toggleValue] == 1) {
     fill (255, 0, 0);
   } else {
     fill (125, 0, 0);
   }
     rect (x, y, w, h);
}

void buttonOnScreenGreen(int x, int y, int w, int h, int toggleValue){
   if (myButton [toggleValue] == 1) {
     fill (0, 255, 0);
   } else {
     fill (0, 125, 0);
   }
     rect (x, y, w, h);
}

void buttonOnScreenBlue(int x, int y, int w, int h, int toggleValue){
     if (myButton [toggleValue] == 1) {
     fill (0, 0, 255);
   } else {
     fill (0, 0, 125);
   }
     rect (x, y, w, h);
}

// This receives the incoming OSC messages
// more info at: http://www.sojamo.de/libraries/oscP5/
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());

  myMessage = theOscMessage.addrPattern();

    if(myMessage.indexOf("/1/push") !=-1){   // Filters out any toggle buttons
    int i = int((myMessage.charAt(7) )) - 0x30;   // returns the ASCII number so convert into a real number by subtracting 0x30
    myButton[i]  = int(theOscMessage.get(0).floatValue());     //  Puts button value into led[i]
     }

    if(myMessage.indexOf("/1/toggle") !=-1){   // Filters out any push buttons
    int i = int((myMessage.charAt(9) )) - 0x30;   // returns the ASCII number so convert into a real number by subtracting 0x30
    myButton[0]  = int(theOscMessage.get(0).floatValue());     //  Puts button value into led[i]
     }

    println (myMessage);
    println ("mybutton 0: "+myButton[0]);
    println ("mybutton 1: "+myButton[1]);
    println ("mybutton 2: "+myButton[2]);
    println ("mybutton 3: "+myButton[3]);
    println ("mybutton 4: "+myButton[4]);
    println ("mybutton 5: "+myButton[5]);
    println ("mybutton 6: "+myButton[6]);
    println ("mybutton 7: "+myButton[7]);
    println ("mybutton 8: "+myButton[8]);
    println ("mybutton 9: "+myButton[9]);
}
