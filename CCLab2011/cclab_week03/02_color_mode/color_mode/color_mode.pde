/*
 * Color Mode
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/12/11
 */
 
void setup() {
  size(600,600);
  smooth();
  // changes color settings from RGB to HSB (hue, saturation, value)
  colorMode(HSB);
}

void draw() {
  background(0);

  for(int i=255 ; i>0 ; i--) {
    fill(i,255,255);
    stroke(i,255,255);
    ellipse(width/2, height/2, i*2, i*2);
  }

}
