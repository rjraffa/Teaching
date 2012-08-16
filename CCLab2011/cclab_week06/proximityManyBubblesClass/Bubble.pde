class Bubble {
  
  //Properties
  float x;
  float y;
  float w;
  float h;
  
  color bubbleColor;
  color bubbleColor1;
  color bubbleColor2;

  float bubbleDistance;
  
  float colorDist;

  //Constructor
  Bubble (float x, float y, float w, float h, color c, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.bubbleColor = c;
    
    this.bubbleColor1 = c;
    this.bubbleColor2 = c2;

    //arbitrary numbers to give initial instance information
    this.colorDist = 0;
    this.bubbleDistance = 100;
    

  }

  // Method or Function
  void drawBubble() {
    pushMatrix();

    fill(this.bubbleColor);
    ellipse(this.x, this.y, this.w, this.h);

    popMatrix();
  }

  void updateBubble(float _maxFrameSize) {
    //determines distance from mouseX/mouseY to center of bubble    
    this.bubbleDistance = dist (mouseX, mouseY, this.x, this.y);
    
    //maps distance from mouseX/mouseY to size of circle        
    this.w = map(this.bubbleDistance, 0, _maxFrameSize, 200, 0);
    this.h = map(this.bubbleDistance, 0, _maxFrameSize, 200, 0);

    //maps distance to value that can be used for lerpColor
    this.colorDist = map(this.bubbleDistance, 0, _maxFrameSize, 1.0, 0.0);
    
    //maps distance to value between very red and back
    this.bubbleColor = lerpColor(this.bubbleColor1, this.bubbleColor2, this.colorDist);


  }


}

