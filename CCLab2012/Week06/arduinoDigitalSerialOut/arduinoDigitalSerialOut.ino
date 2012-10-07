/*
 * Arduino Digital Serial Out
 *
 * CC Lab Fall 2012
 * by Ryan Raffa
 * 10/10/12
 */


int sensorValue;
int sensorPin;
int ledPin;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  
  sensorPin = 2;
  ledPin = 13;
  
  pinMode(2,INPUT);
  pinMode(13,OUTPUT);
}

void loop() {
  
  sensorValue = digitalRead(sensorPin);
  // send the value of analog input 0:
  Serial.println(sensorValue);

  //use an LED for feedback to make sure sensorPin is being read
  if (sensorValue == HIGH) {
    digitalWrite(ledPin, HIGH);
  } else {
    digitalWrite(ledPin,LOW);
    }
  
}

