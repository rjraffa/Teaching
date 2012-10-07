/*
 * Box
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/19/11
 */

void setup() {
  // P3D is Processing 3D
  // check out "size()" in reference
  size(800, 600, P3D);
  background(0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  fill(255,0,0);
  box(150);
}
