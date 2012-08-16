/*
 *  thingy
 *
 *
 */

#include "thingy.h"


//------------------------------------------------------------------
void thingy::setup(ofPoint position, float radius, ofPoint centerPoint, int r, int g, int b, int a) {
    
    //thingy position and size    
    this->position = position;
    this->radius = radius;
    
    this->centerPoint = centerPoint;
    
    //thingy color
    this->r = r;
    this->g = g;
    this->b = b;
    this->a = a;
    
    //thingy motion. these values are somewhat arbitrary for initial setup.
    distance = 1000;
    rotation = 0;
    rotationMod = 0;
    distFromCenter = r;
    
}



//------------------------------------------------------------------
void thingy::update(float x, float y) {
    
    //captures the distance from thingyX and thingyY to mouseX/MouseY
    distance = ofDist (centerPoint.x, centerPoint.y, x, y);
    
    //maps distance to a value that can be used for rotation
    rotationMod = ofMap(distance, 0, r, 500, 0.1, true);
    
    //maps distance to a value that can be used for the size of circle
    distFromCenter = ofMap(distance, 0, r, 60, 20, true);
    
    //determines rotation
    rotation += ofDegToRad(rotationMod);
    
}



//------------------------------------------------------------------
void thingy::draw() {
    ofPushMatrix();

    ofTranslate(centerPoint.x, centerPoint.y);

    ofSetColor(r, g, b, a);

    ofRotate(rotation);
    
    //four circles centered around a common center point
    ofCircle(-position.x, -position.y, distFromCenter);
    ofCircle(position.x, -position.y, distFromCenter);
    ofCircle(position.x, position.y, distFromCenter);
    ofCircle(-position.x, position.y, distFromCenter);

    ofPopMatrix();
    
}

