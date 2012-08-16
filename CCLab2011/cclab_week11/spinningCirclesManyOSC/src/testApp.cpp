#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    ofBackground(255, 255, 255);
	ofEnableAlphaBlending();
	ofSetVerticalSync(true);
    
    // listen on the given port
	cout << "listening for osc messages on port " << PORT << "\n";
	receiver.setup( PORT );
    
	current_msg_string = 0;
	myIncoming = 0;
	mouseButtonState = "";
    
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
    
    // hide old messages
	for ( int i=0; i<NUM_MSG_STRINGS; i++ )
	{
		if ( timers[i] < ofGetElapsedTimef() )
			msg_strings[i] = "";
	}
    
	// check for waiting messages
	while( receiver.hasWaitingMessages() )
	{
		// get the next message
		ofxOscMessage m;
		receiver.getNextMessage( &m );
        
		// check for mouse moved message
		if ( m.getAddress() == "/mouse/position" )
		{
			// both the arguments are int32's
			myIncoming.x = m.getArgAsInt32( 0 );
			myIncoming.y = m.getArgAsInt32( 1 );
		}
		// check for mouse button message
		else if ( m.getAddress() == "/mouse/button" )
		{
			// the single argument is a string
			mouseButtonState = m.getArgAsString( 0 ) ;
		}
		else
		{
			// unrecognized message: display on the bottom of the screen
			string msg_string;
			msg_string = m.getAddress();
			msg_string += ": ";
			for ( int i=0; i<m.getNumArgs(); i++ )
			{
				// get the argument type
				msg_string += m.getArgTypeName( i );
				msg_string += ":";
				// display the argument - make sure we get the right type
				if( m.getArgType( i ) == OFXOSC_TYPE_INT32 )
					msg_string += ofToString( m.getArgAsInt32( i ) );
				else if( m.getArgType( i ) == OFXOSC_TYPE_FLOAT )
					msg_string += ofToString( m.getArgAsFloat( i ) );
				else if( m.getArgType( i ) == OFXOSC_TYPE_STRING )
					msg_string += m.getArgAsString( i );
				else
					msg_string += "unknown";
			}
			// add to the list of strings to display
			msg_strings[current_msg_string] = msg_string;
			timers[current_msg_string] = ofGetElapsedTimef() + 5.0f;
			current_msg_string = ( current_msg_string + 1 ) % NUM_MSG_STRINGS;
			// clear the next line
			msg_strings[current_msg_string] = "";
		}
        
	}
    
    //updating spinningCircles
    for (int i = 0; i < NUM_POINTS; i++){
        spinningCircles[i].update(myIncoming.x, myIncoming.y);
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