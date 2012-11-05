/*
 *  coloredCircles.h
 *  coloredCirclesClass
 *
 *
 */

#include "coloredCircle.h"

//------------------------------------------------------------------
void coloredCircle::setup(ofPoint myPoints) {
    
    this->myPoints = myPoints; 

}



//------------------------------------------------------------------
void coloredCircle::update(float x, float y, int red) {
    
    dist = ofDist(x, y, myPoints.x, myPoints.y);
    radius = ofMap(dist, 0, 300, 200, 0, true);
    
    ofSetColor(red, 0, 0, 30);

    //or we could have each color pick it's own color
    //myRed = ofMap(dist, 0, 100, 255, 0, true);

}



//------------------------------------------------------------------
void coloredCircle::draw() {
    ofPushMatrix();
    //    for example of when you keep track of each position and change color based on that
    //    ofSetColor(myRed, 0, 0, 30);
    ofCircle(myPoints.x, myPoints.y, radius);
    ofPopMatrix();

}

