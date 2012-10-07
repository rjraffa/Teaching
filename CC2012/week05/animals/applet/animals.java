import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 

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

public class animals extends PApplet {

/*
 * Animals
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 09/27/12
 */



PImage catImage;
PImage dogImage;
PImage lionImage;
PImage pigImage;

boolean playCat;
boolean playDog;
boolean playLion;
boolean playPig;

Minim minim;
AudioPlayer cat;
AudioPlayer dog;
AudioPlayer lion;
AudioPlayer pig;

public void setup() {
  size(500, 500);
  
  catImage = loadImage("cat.jpg");
  dogImage = loadImage("dog.jpg");
  lionImage = loadImage("lion.jpg");
  pigImage = loadImage("pig.jpg");
  
  minim = new Minim(this);
  // load the sound files
  cat = minim.loadFile("cat.wav", 2048);
  dog = minim.loadFile("dog.wav", 2048);
  lion = minim.loadFile("lion.wav", 2048);
  pig = minim.loadFile("pig.wav", 2048);

}

public void draw() {
  background(0);

  image(catImage, 0, 0);
  image(dogImage, width/2, 0);
  image(lionImage, 0, height/2);
  image(pigImage, width/2, height/2);


}

public void mousePressed() {
  
    if (mouseX < width/2 && mouseY < height/2) {
      cat.play(0);
    } 
  
    if (mouseX > width/2 && mouseY < height/2) {
      dog.play(0);
    }

    if (mouseX < width/2 && mouseY > height/2) {
      lion.play(0);
    }

    if (mouseX > width/2 && mouseY > height/2) {
      pig.play(0);
    }

}

public void stop() {
  // always close Minim audio classes when you are done with them
  cat.close();
  dog.close();
  lion.close();
  pig.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "animals" });
  }
}
