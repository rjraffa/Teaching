#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    ofBackground(255, 255, 255);
	ofEnableAlphaBlending();
	ofSetVerticalSync(true);

    ofPoint position(10,10);
    float radius = 50;
    
    ofPoint centerPoint1 (150,150);
    
    int color = 255;
    
    myThingy1.setup(position,radius,centerPoint1, 255, 0, 0, 50);  

    bFullscreen = 0;
    
    screenWidth = 500;
	screenHeight = 500;
	ofSetWindowShape(screenWidth, screenHeight);


}

//--------------------------------------------------------------
void testApp::update(){

    myThingy1.update(mouseX, mouseY);

}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofBackground(255, 255, 255);

    myThingy1.draw();
    
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