/*
 * Nyan Cat Web with If/Else and Moving
 * Load a web image and move it across the screen
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/13/12
 */
 
PImage nyanCat;

int posX;
int posY;

void setup() {
  size(250, 250);
  
  //Here is where we import the URL image
  //and assign it to the nyanCat global variable
  nyanCat = loadImage("http://upload.wikimedia.org/wikipedia/en/e/ed/Nyan_cat_250px_frame.PNG");

  posX = 0;
  posY = 0;
}

void draw() {

  //  background(255,255);


  //If the posX is greater than the width
  //posX becomes -250, the width of the image
  //Otherwise (or else), 1 is added to posX
  //each loop through the void draw

  if (posX > width) {
    posX= -250;
  } 
  else {
    posX++;
  }

  //Here is where we draw the image
  //The X and Y positions are variables posX and posY
  image(nyanCat, posX, posY);

}

