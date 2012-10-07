/*
 * Rotate
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/19/11
 */

void setup() {
  size(800, 600, P3D);
  background(0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke (200);
  fill(255,0,0);
  
  float myXRadian = radians(mouseX);
  float myYRadian = radians(mouseY);
  rotateX(myXRadian);
  rotateY(myYRadian);
  
  box(150);
  
  // Green line is X axis
  stroke (0, 255, 0);
  line (-200, 0, 200, 0);
  
  // Blue line is Y axis
  stroke (0, 0, 255);
  line (0, -200, 0, 200);
  
  // Purple line is Z axis
  // using vertex points
  stroke (125, 0, 125);  
  line (0,0,-200,0,0,200);
  // or use beginShape() / endShape()
  //beginShape(LINES);
  //vertex(0,0,200);
  //vertex(0,0,-200);
  //endShape();
  
  println ( myXRadian + " / " + myYRadian);
}
