/*
 * Sound Analysis 3D
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/19/11
 */

import processing.opengl.*;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

void setup() {
  size(600, 600, OPENGL);
  smooth();

  minim = new Minim(this);

  jingle = minim.loadFile("imninetoday.mp3", 2048);
  // loop the file
  jingle.loop();

  // create an FFT object that has a time-domain buffer the same size as jingle’s sample buffer
  // and a sample rate that is the same as jingle’s
  // note that this needs to be a power of two
  // and that it means the size of the spectrum will be 1024.
  // see the online tutorial for more info.
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // use 128 averages.
  // the maximum number of averages we could ask for is half the spectrum size.
  fft.linAverages(128);
  rectMode(CORNERS);
  colorMode(HSB);
}

void draw() {
  background(0);
  noFill();
  translate(width/2,height/2, -300);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  // perform a forward FFT on the samples in jingle’s mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fft.forward(jingle.mix);
  int w = int(fft.specSize()/128);
  
  for(int i=1 ; i<20 ; i=i+2) {
    for(int j=1 ; j<20 ; j=j+2) {
      for(int k = 0; k < fft.avgSize(); k++) {
        pushMatrix();
        stroke(fft.getAvg(k)*50, 255, 255);
        translate(-width/2, -height/2, k*30);
        // draw a rectangle for each average, multiply the value by 5 so we can see it better
        rect(i*w, height, j*w + w, height - fft.getAvg(k)*5);
        popMatrix();
        }
    }
  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}
