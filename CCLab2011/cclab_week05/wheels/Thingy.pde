class Thingy {
 
 //Properties
 float thingyPosX;
 float thingyPosY;
 float thingyWidth;
 float thingyHeight;
 color thingyColor;
 
 //Constructor
 Thingy (float x, float y, float w, float h, color c) {
   this.thingyPosX = x;
   this.thingyPosY = y;
   this.thingyWidth = w;
   this.thingyHeight = h;
   this.thingyColor = c;
 }
 
 // Method or Function
 void drawThingy(float xPos, float yPos) {
  pushMatrix();
  translate(xPos, yPos);
  fill(this.thingyColor);
  ellipse( -this.thingyPosX, -this.thingyPosY, this.thingyWidth, this.thingyHeight );
  ellipse( this.thingyPosX, -this.thingyPosY, this.thingyWidth, this.thingyHeight );
  ellipse( this.thingyPosX, this.thingyPosY, this.thingyWidth, this.thingyHeight );
  ellipse( -this.thingyPosX, this.thingyPosY, this.thingyWidth, this.thingyHeight );
  popMatrix();
 }
 
  
}
