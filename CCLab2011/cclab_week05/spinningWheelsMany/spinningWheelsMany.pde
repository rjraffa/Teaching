/*
 * Spinning Wheels Many
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 10/7/11
 */
 
// Creating instances of our object called "Thingy"
Thingy [] thingyArray = new Thingy[200];

float [] locationX = new float[200];
float [] locationY = new float[200];

void setup() {
  size (600, 600);
  background(255);
  smooth();
  noStroke();

  for (int i=0; i<thingyArray.length; i++){
    int thingyLocation = 10;
    int thingySize = 50;
    
    thingyArray[i] = new Thingy(thingyLocation, thingyLocation, 
      thingySize, thingySize, color (random(255), random(255), random(255), 130));
    } 

  for (int i=0; i<locationX.length; i++){
    locationX[i] = random(0,width);
    locationY[i] = random(0,height);
  }

}

void draw() {
  background(255);
  
  for(int i=0; i<thingyArray.length; i++) {
    thingyArray[i].updateThingy(locationX[i], locationY[i]);
    thingyArray[i].drawThingy(locationX[i], locationY[i]);
  }
  
}
