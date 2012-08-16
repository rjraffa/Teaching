/*
 *  coloredCircles.h
 *  coloredCirclesClass
 *
 *
 */

#ifndef _coloredCircle
#define _coloredCircle


#include "ofMain.h"


class coloredCircle {
	
	public:
		void setup(ofPoint myPoints);
		void update(float x, float y, int red);
		void draw();
    
        ofPoint myPoints;
    
        float dist;
        float radius;
    
        int myRed;
    
};

#endif
