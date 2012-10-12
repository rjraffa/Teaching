/*
 * xSpiral
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 09/20/12
 */
 
 float radius = 0.25;

float deg;

void setup() {
  size(800,800);
  smooth();
  background(255);
  
  deg = 0.0;

}

void draw() {
  
  // Move the origin to the center of screen
  translate(width/2, height/2);
  
  if (mousePressed==true) {
    deg-=2;
    background(255);
  } else {
    background(255); 
  }
  
  float rad = radians(deg);
  rotate(rad);
  
  for (int i = 0; i < 1500; i++) {
    // Point 1
    int deg1 = int(i);
    float angle1 = radians(deg1);
    float x1 = cos(angle1) * radius*i;
    float y1 = sin(angle1) * radius*i;
    
    // Point 2
    int deg2 = int(i+1);
    float angle2 = radians(deg2);
    float x2 = cos(angle2) * radius*i;
    float y2 = sin(angle2) * radius*i;
    
    stroke(random(255),random(255),random(255));
    line(x1, y1, x2, y2);
  }
}
