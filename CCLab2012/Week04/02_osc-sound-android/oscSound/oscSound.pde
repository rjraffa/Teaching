/**
 * oscSound 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 09/17/12
 */
 
import oscP5.*;
import netP5.*;

import ddf.minim.*;
import ddf.minim.signals.*;

OscP5 oscP5;
Minim minim;
AudioOutput out;

SineWave sine;
SawWave saw;
SquareWave sqa;
TriangleWave tri;

String myMessage;
int myColor;

int [] myButton = new int [1];
int [] myMultiToggle = new int [4];
float xValue;
float yValue;

void setup() {
  size(500,400);
  
  myButton[0] = 0;
  
  myMultiToggle[0] = 1;
  myMultiToggle[0] = 0;
  myMultiToggle[0] = 0;
  myMultiToggle[0] = 0;
  
  xValue = 0;
  yValue = 0;

  minim = new Minim(this);
  // get a line out from Minim, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate to match the line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  saw = new SawWave(440, 0.2, out.sampleRate());
  sqa = new SquareWave(440, 0.2, out.sampleRate());
  tri = new TriangleWave(440, 0.3, out.sampleRate());

  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  saw.portamento(200);
  sqa.portamento(200);
  tri.portamento(200);

  // add the oscillator to the line out
  out.addSignal(sine);
  out.addSignal(saw);
  out.addSignal(sqa);  
  out.addSignal(tri);
  
  /* start oscP5, listening for incoming messages at port 8000 */
  oscP5 = new OscP5(this,8000);
  myColor = 0;
  
}

void draw() {
  background(myColor);
 
 if (myButton[0] == 1) {
   myColor = 255;
   stroke(0);
 } else {
   myColor = 0;
   stroke(255);
 }
  // draw the waveforms
  for(int i = 0; i < out.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  oscSounds(myMultiToggle);
//  println(out.bufferSize());
}

// The following functions draw my boxes on screen
void oscSounds(int theToggle[]){
   if (theToggle[0] == 1) {
      float freq = map(yValue, 0.0, 1.0, 1000, 60);
      sine.setFreq(freq);
      float pan = map(xValue, 0.0, 1.0, -1, 1);
      sine.setPan(pan);     
      sqa.setFreq(0);
      saw.setFreq(0);
      tri.setFreq(0);
   } if (theToggle[1] == 1) {
      float freq = map(yValue, 0.0, 1.0, 1000, 60);
      saw.setFreq(freq);
      float pan = map(xValue, 0.0, 1.0, -1, 1);
      saw.setPan(pan);
      sine.setFreq(0);
      sqa.setFreq(0);
      tri.setFreq(0);
   } if (theToggle[2] == 1) {
      float freq = map(yValue, 0.0, 1.0, 1000, 60);
      sqa.setFreq(freq);
      float pan = map(xValue, 0.0, 1.0, -1, 1);
      sine.setFreq(0);
      sqa.setPan(pan);
      saw.setFreq(0);
      tri.setFreq(0);      
   } if (theToggle[3] == 1) {
      float freq = map(yValue, 0.0, 1.0, 1000, 60);
      tri.setFreq(freq);
      float pan = map(xValue, 0.0, 1.0, -1, 1);
      sine.setFreq(0);
      tri.setPan(pan);
      sqa.setFreq(0);
      saw.setFreq(0);
   }

}

// This receives the incoming OSC messages
// more info at: http://www.sojamo.de/libraries/oscP5/
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());

  myMessage = theOscMessage.addrPattern();

   if(myMessage.indexOf("/3/toggle") !=-1){   // Filters for toggle
     int i = (int((myMessage.charAt(9) )) - 0x30)-1;   // returns the ASCII number so convert into a real number by subtracting 0x30
     myMultiToggle[i]  = int(theOscMessage.get(0).floatValue());     //  Puts value into variable
   }

   if(myMessage.indexOf("/3/xy") !=-1){   // Filters for 2D touch 
     xValue  = theOscMessage.get(0).floatValue();     //  Puts value into variable
     yValue  = theOscMessage.get(1).floatValue();     //  Puts value into variable   
     println("XY received");
   }

   if(myMessage.indexOf("/1/toggle") !=-1){   // Filters for toggle
     myButton[0]  = int(theOscMessage.get(0).floatValue());     //  Puts value into global variable
   }

   println (myMessage);
   println ("mybutton 0: "+myButton[0]);
   println ("myMultiToggle 0: "+myMultiToggle[0]);
   println ("myMultiToggle 1: "+myMultiToggle[1]);
   println ("myMultiToggle 2: "+myMultiToggle[2]);
   println ("myMultiToggle 3: "+myMultiToggle[3]);
   println ("xValue: "+xValue);
   println ("yValue: "+yValue);

}


void stop() {
  out.close();
  minim.stop();
  
  super.stop();
}
