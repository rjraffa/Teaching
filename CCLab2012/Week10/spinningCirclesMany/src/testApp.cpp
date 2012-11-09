#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    ofBackground(255, 255, 255);
	ofEnableAlphaBlending();
	ofSetVerticalSync(true);

    for (int i = 0; i < NUM_POINTS; i++) {
        thingy myThingy;
        ofPoint position(10,10);
        float radius = 50;
        int color = 255;
        ofPoint centerPoint (ofRandom(ofGetScreenWidth()), ofRandom(ofGetScreenHeight()));
        myThingy.setup(position,radius,centerPoint, color, 0, 0, 50);
        spinningCircles.push_back( myThingy );
    }
    
    bFullscreen = 0;
    
    screenWidth = 500;
	screenHeight = 500;
	ofSetWindowShape(screenWidth, screenHeight);

}

//--------------------------------------------------------------
void testApp::update(){
    
    for (int i = 0; i < NUM_POINTS; i++){
        spinningCircles[i].update(mouseX, mouseY);
    }
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(255, 255, 255);
    
    for (int i = 0; i < NUM_POINTS; i++){
        spinningCircles[i].draw();
    }
    
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    
    if(key == 'f'){
		
		bFullscreen = !bFullscreen;
		
		if(!bFullscreen){
			ofSetWindowShape(screenWidth,screenHeight);
			ofSetFullscreen(false);
		} else if(bFullscreen == 1){
			ofSetFullscreen(true);
		}
	
        // or we can just say
        // ofToggleFullscreen();

    }

}

//--------------------------------------------------------------
void testApp::keyReleased(int key){

}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){ 

}