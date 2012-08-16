/*
 *  «FILENAME»
 *  «PROJECTNAME»
 *
 *  Created by «FULLUSERNAME» on «DATE».
 *  Copyright «YEAR». All rights reserved.
 *
 */
#ifndef _thingy
#define _thingy

#include "ofMain.h"

class thingy {
	
	public:
		void setup(ofPoint position, float radius, ofPoint centerPoint, int r, int g, int b, int a);
		void update(float x, float y);
		void draw();
    
    //thingy position and size
    ofPoint position;
    float radius;
    
    //thingy translation point
    ofPoint centerPoint;
    
    //thingy color
    int r;
    int g;
    int b;
    int a;
    
    //thingy motion
    float distance;
    float rotation;
    float rotationMod;
    float distFromCenter;
    
};

#endif
