/*
 * Animals
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/27/12
 */

import ddf.minim.*;

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

void setup() {
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

void draw() {
  background(0);

  image(catImage, 0, 0);
  image(dogImage, width/2, 0);
  image(lionImage, 0, height/2);
  image(pigImage, width/2, height/2);


}

void mousePressed() {
  
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

void stop() {
  // always close Minim audio classes when you are done with them
  cat.close();
  dog.close();
  lion.close();
  pig.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
