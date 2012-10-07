/*
 * Modulo
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/12/11
 */

int stateChange;
int myColor;

void setup() {
  size(600, 600);
  stateChange = 1;
}

void draw () {
  background ( myColor );

  if (frameCount % 60 == 0) {
    stateChange = stateChange * -1;
  }

  if (stateChange > 0) {
    myColor = 255;
  } else {
    myColor = 0;
  }

  println (frameCount +" / "+ stateChange + " / " + myColor );
  
}

