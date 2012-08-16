class Thingy {
 
 //Properties
 float x;
 float y;
 float w;
 float h;
 color c;
 
 //Constructor
 Thingy (float x, float y, float w, float h, color c) {
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   this.c = c;
 }
 
 // Method or Function
 void drawThingy(float xPos, float yPos) {
  pushMatrix();
  translate(xPos, yPos);
  fill(this.c);
  ellipse( -this.x, -this.y, this.w, this.h );
  ellipse( this.x, -this.y, this.w, this.h );
  ellipse( this.x, this.y, this.w, this.h );
  ellipse( -this.x, this.y, this.w, this.h );
  popMatrix();
 }
 
  
}
