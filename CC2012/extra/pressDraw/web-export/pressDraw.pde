/*
 * Mouse Draw
 * To show ways to draw
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 10/09/12
 */
 
//import processing.pdf.*;

int[] positionsX = {-10};
int[] positionsY = {-10};
int[] positionsX1 = {-10};
int[] positionsY1 = {-10};
int[] positionsX2 = {-10};
int[] positionsY2 = {-10};
int[] positionsX3 = {-10};
int[] positionsY3 = {-10};
int[] positionsX4 = {-10};
int[] positionsY4 = {-10};

// A boolean variable that when set to true triggers the PDF recording process
//boolean recordPDF = false; 

void setup() {
  size(800,800, P3D);
  
}

void draw() {
  
    // Begin making the PDF
 // if (recordPDF) {
   // beginRaw(PDF, "####.pdf" ); // If you include "####" in the filename -- "3D-####.pdf" -- separate, numbered PDFs will be made for each frame that is rendered.
  //}
    background (255);
  // Draw points
  
  for (int i = 0; i < positionsX.length; i++) {
      stroke (1);
      //lines from center
      line (positionsX[i], positionsY[i], positionsX1[i], positionsY1[i]);
      line (positionsX[i], positionsY[i], positionsX2[i], positionsY2[i]);
      line (positionsX[i], positionsY[i], positionsX3[i], positionsY3[i]);    
       
      //lines around the outside
      line (positionsX1[i], positionsY1[i], positionsX2[i], positionsY2[i]);
      line (positionsX2[i], positionsY2[i], positionsX3[i], positionsY3[i]);
      line (positionsX[i], positionsY[i], positionsX3[i], positionsY3[i]);    

      if (i > 0) {
        line (positionsX[i], positionsY[i], positionsX[i-1], positionsY[i-1]);
      }
  }
  
  if (mousePressed) {
    
    
  positionsX = append(positionsX, mouseX);
  positionsY = append(positionsY, mouseY);
  
  positionsX1 = append(positionsX1, mouseX);
  positionsY1 = append(positionsY1, mouseY-25);
  positionsX2 = append(positionsX2, mouseX+25);
  positionsY2 = append(positionsY2, mouseY+25);
  positionsX3 = append(positionsX3, mouseX-25);
  positionsY3 = append(positionsY3, mouseY+25);
   
    
  }
  
    // End making the PD
 // if (recordPDF) {
   // endRaw();
    //recordPDF = false;
//  } 
 
}



void keyPressed() {
  // recordPDF = true; 
}

