/*
 * Nyan Cat Web with If/Else
 * Load a web image and use mouse pressed to move it
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/13/12
 */

//Here are the global variables
PImage nyanCat;

int posX;
int posY;

void setup() {
  size(250,250);
  
  //Here is where we import the URL image
  //and assign it to the nyanCat global variable
  nyanCat = loadImage("http://upload.wikimedia.org/wikipedia/en/e/ed/Nyan_cat_250px_frame.PNG");
  
  posX = 0;
  posY = 0;
}

void draw() {
  
  background(255,255);
  
  //Here is the if/else statement
  //If the mouse is pressed, the image is centered on
  //mouseX and mouseY and you are able to move it
  if (mousePressed == true) {
    posX = mouseX-nyanCat.width/2;
    posY = mouseY-nyanCat.height/2;
  } else {
    posX = 0;
    posY = 0;
  }
  
  //Here is where we draw the image
  //The X and Y positions are variables posX and posY
  image(nyanCat, posX, posY);

  
}
