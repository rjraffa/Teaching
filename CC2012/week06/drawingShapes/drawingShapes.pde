/*
 * Drawing Shapes
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/04/12
 */
 
 int posX;
int posY;

boolean pickSquare, pickCircle, pickTriangle, pickClear;

PFont font;

void setup () {
 size(1000,800);
 background(255);
 
 posX = 200;
 posY = 200;
 
 pickSquare = false;
 pickCircle = false;
 pickTriangle = false;
 pickClear = false;
 
 font = loadFont("Arial-BoldMT-24.vlw");
 textFont(font);

  
}


void draw() {
    
  if (pickSquare == true) {
    if (mousePressed == true && mouseX > posX) {
     fill(255,0,0,150);
       rectMode(CENTER);
       rect(mouseX, mouseY, 50, 50);
       rectMode(CORNER);
    }
  }
  
  if (pickCircle == true) {
    if (mousePressed == true && mouseX > posX) {
     fill(0,255,0,150);
     ellipse(mouseX, mouseY, 50, 50); 
    }
  }
  
  if (pickTriangle == true) {
    if (mousePressed == true && mouseX > posX) {
     fill(0,0,255,150);
     triangle(mouseX, mouseY-25, mouseX+25, mouseY+25, mouseX-25, mouseY+25); 
    }
  }

  if (pickClear == true) {
   fill(255);
   rect(0, 0, width, height); 
  }

  //for the square button 
  fill(150);
  rect(0, 0, 200, 200);
  fill(255,0,0);
  rect(75, 75, 50, 50);
  
  if (mousePressed==true && mouseX < 200 && mouseY < 200) {
     pickSquare = true;
     pickCircle = false;
     pickTriangle = false;
     pickClear = false;
  }
  
  //for the circle button
  fill(150);
  rect(0, 200, 200, 200);
  fill(0,255,0);
  ellipse(100, 300, 50, 50);
  
    if (mousePressed==true && mouseX < 200 && mouseY > 200 && mouseY < 400) {
     pickSquare = false;
     pickCircle = true;
     pickTriangle = false;
     pickClear = false;
  }

  //for the triangle button
  fill(150);
  rect(0, 400, 200, 200);
  fill(0,0,255);
  triangle(100, 475, 125, 525, 75, 525); 

  if (mousePressed==true && mouseX < 200 && mouseY > 400 && mouseY < 600) {
     pickSquare = false;
     pickCircle = false;
     pickTriangle = true;
     pickClear = false;
  }

  //for the clear button  
  fill(150);
  rect(0, 600, 200, 200);
  fill(0);
  text("clear", 70, 700); 
  
  if (mousePressed==true && mouseX < 200 && mouseY > 600) {
     pickSquare = false;
     pickCircle = false;
     pickTriangle = false;
     pickClear = true;
  }

  
}
