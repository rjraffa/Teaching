 /*
 * Based on code from Lucky Larry
 * http://luckylarry.co.uk/arduino-projects/using-processing-to-send-values-to-arduino/
 *
 * processingSender 
 * CC Lab Fall 2012
 *
 * by Ryan Raffa
 * 10/07/12
 */
 
import processing.serial.*;
Serial myPort;

int lightValue;

void setup () {
    size(600,600);
  
    lightValue = 0;
    
    println(Serial.list());
    myPort = new Serial(this, Serial.list()[1], 9600);
}
 
void draw () {
    // set background to lightValue
    // mouseY at the bottom of draw window = no light and screen is black
    // mouseY at the top of draw window = LED fully lit and screen is white
    background(lightValue);

    lightValue = mouseY;
    lightValue = int(map(lightValue, 0, height, 255, 0));

    myPort.write(lightValue);
    myPort.write(lightValue);
    myPort.write(lightValue);

}
