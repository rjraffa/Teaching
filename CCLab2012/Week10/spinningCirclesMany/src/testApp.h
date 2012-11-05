#pragma once

#include "ofMain.h"
#include "thingy.h"

#define NUM_POINTS 1000

class testApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed  (int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);

        vector <thingy> spinningCircles;
        vector <float> crazyAmountOfFloats;
    
        //two int variables called screenWidth and screenHeight
        int screenWidth, screenHeight;

        //boolean called bFullscreen 
        bool bFullscreen;

};
