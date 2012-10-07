 /*
 Based on code from Tom Igoe
 
 Created 26 Sept. 2005
 by Tom Igoe
 Modified 4 Sep 2010
 by Tom Igoe and Scott Fitzgerald
 This example code is in the public domain.
 http://www.arduino.cc/en/Tutorial/SerialCallResponseASCII 
 */

int analogSensorZero    = 0;    // analog sensor A0
int analogSensorOne     = 0;   // analog sensor A1
int analogSensorTwo     = 0;   // analog sensor A2
int analogSensorThree   = 0;   // analog sensor A3
int analogSensorFour    = 0;   // analog sensor A4
int analogSensorFive    = 0;   // analog sensor A5

int digitalSensor [5];    // digital sensor
int digitalOutput [7];    // digital output

int inByte              = 0;         // incoming serial byte

void setup()
{
  // start serial port at 9600 bps:
  Serial.begin(9600);
  
  for (int i = 2; i < 7; i++){
    pinMode(i, INPUT);   // digital sensor is on digital pins 2 through 6
  }
  
  for (int i = 7; i < 14; i++){
    pinMode(i, OUTPUT);   // digital output is on digital pins 7 through 13
    digitalOutput[i-7] = i;
  }
  
  establishContact();  // send a byte to establish contact until receiver responds 
}

void loop() {
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    
    // read analog input
    analogSensorZero    = analogRead(A0);
    analogSensorOne     = analogRead(A1);
    analogSensorTwo     = analogRead(A2);
    analogSensorThree   = analogRead(A3);
    analogSensorFour    = analogRead(A4);
    analogSensorFive    = analogRead(A5);
    
    // delay 10ms to let the ADC recover:
    delay(10);
    
    // read  switch, map it to 0 or 255L
    digitalSensor[0]   = digitalRead(2);
    digitalSensor[1]   = digitalRead(3);
    digitalSensor[2]   = digitalRead(4);
    digitalSensor[3]   = digitalRead(5);
    digitalSensor[4]   = digitalRead(6);

    
    for (int i = 0; i < 5; i++) {
      if (digitalSensor[i] == HIGH) {
        digitalWrite (digitalOutput[i], HIGH);
      } else {
        digitalWrite (digitalOutput[i], LOW);
      }
    }

    // send sensor values:
    Serial.print(analogSensorZero, DEC);
    Serial.print(",");
    Serial.print(analogSensorOne, DEC);
    Serial.print(",");
    Serial.print(analogSensorTwo, DEC);
    Serial.print(",");
    Serial.print(analogSensorThree, DEC);
    Serial.print(",");
    Serial.print(analogSensorFour, DEC);
    Serial.print(",");
    Serial.print(analogSensorFive, DEC);
    Serial.print(",");
    Serial.print(digitalSensor[0], DEC);
    Serial.print(",");
    Serial.print(digitalSensor[1], DEC);
    Serial.print(",");
    Serial.print(digitalSensor[2], DEC);
    Serial.print(",");
    Serial.print(digitalSensor[3], DEC);
    Serial.print(",");
    Serial.println(digitalSensor[4], DEC);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0,0,0,0,0,0,0,0,0");   // send an initial string
    delay(300);
  }
}

