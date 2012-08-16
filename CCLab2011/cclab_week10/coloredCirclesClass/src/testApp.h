#pragma once

#include "ofMain.h"
#include "coloredCircle.h"

#define NUM_POINTS 1000
#define	NUM_SCREENWIDTH 1800

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
    
    // These are the methods & variables, etc are added to the emptyExample
    void drawPoints(int redValue);
    
    vector <coloredCircle> coloredCircles;
        
    //two int variables called screenWidth and screenHeight
    int screenWidth, screenHeight;
    
    //one int variable called startingPoint
    int startingPoint;
    
    //keeps track of mapped mouseX value for color 
    int red;
    
    //boolean called bFullscreen 
    bool bFullscreen;
    
    
};
