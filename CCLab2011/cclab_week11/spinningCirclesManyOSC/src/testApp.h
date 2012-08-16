#pragma once

#include "ofMain.h"
#include "thingy.h"
#include "ofxOsc.h"

#define PORT 8000
#define NUM_MSG_STRINGS 20

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
            
        //two int variables called screenWidth and screenHeight
        int screenWidth, screenHeight;

        //boolean called bFullscreen 
        bool bFullscreen;
    
        ofxOscReceiver	receiver;
        
        int				current_msg_string;
        string          msg_strings[NUM_MSG_STRINGS];
        float			timers[NUM_MSG_STRINGS];
        
        ofPoint         myIncoming;
        string			mouseButtonState;

};
