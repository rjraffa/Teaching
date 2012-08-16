class Thingy {

  //Properties
  float posX;
  float posY;
  float w;
  float h;
  color c;

  float thingyDistance;
  float thingyRotation;
  float thingyRotationMod;
  float thingyDistFromCenter;

  //Constructor
  Thingy (float posX, float posY, float w, color c) {
    this.posX = posX;
    this.posY = posY;
    this.w = w;
    this.h = w;
    this.c = c;

    //arbitrary numbers to give initial instance information
    this.thingyDistance = 100;
    this.thingyRotationMod = 0;
    this.thingyRotation = 0;
    this.thingyDistFromCenter = w;
  }

  // Method or Function
  void drawThingy(float posX, float posY) {
    pushMatrix();
    fill(this.c);

    translate(posX, posY);
    rotate(this.thingyRotation);

    ellipse( -this.posX, -this.posY, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.posX, -this.posY, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( this.posX, this.posY, this.thingyDistFromCenter, this.thingyDistFromCenter );
    ellipse( -this.posX, this.posY, this.thingyDistFromCenter, this.thingyDistFromCenter );
    popMatrix();
  }

  void updateThingy(float xPos, float yPos, boolean buttonPush) {

    if (buttonPush) {
      if (this.thingyDistance > 0) {
        this.thingyDistance=this.thingyDistance-10; 
      } else {
        this.thingyDistance = 0;
      }
    }
   if (!buttonPush) {
     if (this.thingyDistance < width) {
         this.thingyDistance=this.thingyDistance+10;
     } else {
       this.thingyDistance = width;
     }
   }  
   
    //maps distance to a value that can be used for rotation
    this.thingyRotationMod = map (this.thingyDistance, 0, width, 10, .1);

    //maps distance to a value that can be used for the size of circle
    this.thingyDistFromCenter = map(this.thingyDistance, 0, width, 160, 70);

    //determines rotation
    this.thingyRotation += radians (this.thingyRotationMod);
}
  
}

