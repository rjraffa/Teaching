#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    ofBackground(255, 255, 255);
	ofEnableAlphaBlending();
	ofSetVerticalSync(true);
    
    bFullscreen = 0;
	
	screenWidth = ofGetScreenWidth();
	screenHeight = ofGetScreenHeight();
	ofSetWindowShape(screenWidth, screenHeight);
	
	for (int i=0; i<NUM_POINTS; i++) {
		myPoints[i].x = ofRandom(0, screenWidth);
		myPoints[i].y = ofRandom(0, screenHeight);
	}
}

//--------------------------------------------------------------
void testApp::update(){

    red = ofMap(mouseX, 0, screenWidth, 0, 255, true);
}

//--------------------------------------------------------------
void testApp::draw(){
    
    drawPoints(red);
    
}

//--------------------------------------------------------------
//Function created for this example
void testApp::drawPoints(int redValue) {
    
	ofSetColor(redValue, 0, 0, 30);
	
	for (int i=0; i<NUM_POINTS; i++) {
		float dist = ofDist(mouseX, mouseY, myPoints[i].x, myPoints[i].y);
		float radius = ofMap(dist, 0, 300, 200, 0, true);
		ofCircle(myPoints[i].x, myPoints[i].y, radius);
	}
    
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    
    if(key == 'f'){
		
		bFullscreen = !bFullscreen;
		
		if(!bFullscreen){
			ofSetWindowShape(ofGetScreenWidth(),ofGetScreenHeight());
			ofSetFullscreen(false);
		} else if(bFullscreen == 1){
			ofSetFullscreen(true);
		}
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