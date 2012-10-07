/*
 * CC Lab Quiz
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 8/27/12
 */


int radius = 300;  //What is the difference between an int and a float?

float [] xPos = new float [36];  //What are these called and what do they do?
float [] yPos = new float [36];


void setup() {        //Describe what "setup" does:
  size(800,800);      //What does this do?
  smooth();           //What does this do?
  background(255);    //What does this do?
  
  //Describe what's happening here:
  for (int i = 0; i < 36; i++) {
    int deg = i * 10;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  
}

void draw() {      //Describe what "draw" does generally:

  //Describe what's happening here:
  translate(width/2, height/2);
  
  //Describe what's happening here:
  if (mousePressed == true) {
    fill(random(0, 255), random(0, 255), random(0, 255));
  } else {
    fill(255);
  }

  //Describe what's happening here:
  for (int i = 0; i < 36; i++) {
    ellipse(xPos[i], yPos[i], 10, 10);    
  }

}
//Describe what this sketch does:
