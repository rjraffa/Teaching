/*
 * My First Function
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/12/11
 */
 
int posX, posY;

void setup () {
  size (550, 550);
  posX = 100;
  posY = 100;
}


void draw () {
  background(0);
  drawRGBRects(100, 100, 150, 150);  
}

// this is an example of a function 
void drawRGBRects (int x, int y, int w, int h) {
    fill (255, 0, 0);
    rect (x, y, w, h);
    
    fill (0, 255, 0);
    rect (x+posX, y+posY, w, h);
    
    fill (0, 0, 255);
    rect (x+posX*2, y+posY*2, w, h);
  
}
