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
	    
    // vector of colored circles
	for (int i = 0; i < NUM_POINTS; i++){
		coloredCircle myColoredCircle;
        ofPoint myPoint;
        myPoint.x = ofRandom(0, screenWidth);
        myPoint.y = ofRandom(0, screenHeight);
		myColoredCircle.setup(myPoint);
		coloredCircles.push_back( myColoredCircle );        
	}

}

//--------------------------------------------------------------
void testApp::update(){
    ofBackground(255, 255, 255);

    red = ofMap(mouseX, 0, screenWidth, 0, 255, true);

    
    for (int i = 0; i < NUM_POINTS; i++){
		coloredCircles[i].update(mouseX, mouseY, red);
	}
    
    printf("coloredCircle one area size: %f\n",coloredCircles[0].dist);


}

//--------------------------------------------------------------
void testApp::draw(){
    
    for (int i = 0; i < NUM_POINTS; i++){
		coloredCircles[i].draw();
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