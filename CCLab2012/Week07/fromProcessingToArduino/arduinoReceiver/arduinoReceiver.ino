 /*
 * Based on code from Lucky Larry
 * http://luckylarry.co.uk/arduino-projects/using-processing-to-send-values-to-arduino/
 *
 * arduinoReceiver 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 10/07/12
 */

// create an array of PWM digital pins
int ledPin[] = {9,10,11};
// values from Processing via serial port
int incomingByte[3]; 
 
void setup() {
  // initialize serial communication
  Serial.begin(9600);
 
  for (int i=0; i<3; i++) {
    pinMode(ledPin[i], OUTPUT);
  }
}

 
void loop() {

  if (Serial.available() >= 3) {
    for (int i=0; i<3; i++) {
      incomingByte[i] = Serial.read();
      analogWrite(ledPin[i], incomingByte[i]);
    }
  }
 
}
