/*
 * Mouse Draw
 * To show ways to draw
 *
 * CC Fall 2012
 * by Ryan Raffa
 * 10/09/12
 */
 
import processing.pdf.*;

int cols;
int rows;

int[][] myArray;

// A boolean variable that when set to true triggers the PDF recording process
boolean recordPDF = false; 

void setup() {
  size(800,800, P3D);
  cols = width;
  rows = height;
  // Declare 2D array
  myArray = new int[rows][cols];
  
  // Initialize 2D array values
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      myArray[i][j] = int(250);
    }
  }

}

void draw() {
  
    // Begin making the PDF
  if (recordPDF) {
    beginRaw(PDF, "####.pdf" ); // If you include "####" in the filename -- "3D-####.pdf" -- separate, numbered PDFs will be made for each frame that is rendered.
  }

  // Draw points
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      stroke(myArray[i][j]);
      point(i,j);
    }
  }
  
    // End making the PDF
  if (recordPDF) {
    endRaw();
    recordPDF = false;
  }

}

void mouseMoved() {
  myArray[mouseX][mouseY] = 0;
}

// Make the PDF when the mouse is pressed
void mousePressed() {
  recordPDF = true;
}
