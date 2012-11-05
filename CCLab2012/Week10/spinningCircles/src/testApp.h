#pragma once

#include "ofMain.h"
#include "thingy.h"

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
    
    
        float position1, position2, position3;

        thingy myThingy1, myThingy2, myThingy3;
        
        //two int variables called screenWidth and screenHeight
        int screenWidth, screenHeight;

        //boolean called bFullscreen 
        bool bFullscreen;

};
