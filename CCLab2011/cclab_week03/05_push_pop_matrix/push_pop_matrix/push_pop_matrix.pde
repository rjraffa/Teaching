/*
 * Push Pop Matrix
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/12/11
 */
 
void setup() {
  size(600,300);
}

void draw() {
  background(0);
  
  fill(255,0,0);
  rect(0,0,50,50);

  pushMatrix();
    translate(300,50);
    fill(0,255,0);
    rect(0,0,50,50);
  popMatrix();

  fill(0,0,255);
  rect(100,100,50,50);
}
