/* Based on code from amnon.owed
 * http://forum.processing.org/topic/particle-collision-within-a-circle
 *
 * bounceCircle
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/12/12
 */

PVector origin = new PVector();
int diameter = 300;
int radius = diameter/2;
Particle [] particleArray = new Particle [5];
 
void setup() {
  size(500, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
  
  for(int i = 0 ; i < particleArray.length ; i++) {
    particleArray[i] = new Particle();
  }

  noStroke();
  smooth();
}
 
void draw () {
  translate(width/2, height/2);
  fill(180, 0, 0, 5);
  ellipse(0, 0, diameter, diameter);

  for (int i = 0; i < 5; i++) {
    particleArray[i].update();
    particleArray[i].display();
  }
}
 
void keyPressed() { 
  for (int i = 0; i < 5; i++) {
    particleArray[i].randomDirection(); 
  }
}
