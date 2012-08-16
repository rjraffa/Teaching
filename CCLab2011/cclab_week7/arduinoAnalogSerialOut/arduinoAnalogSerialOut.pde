int sensorValue;
int sensorPin;
int ledPin;

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
  
  sensorPin = A0;
  ledPin = 13;
  
  pinMode(13,OUTPUT);
}

void loop() {
  
  sensorValue = analogRead(sensorPin);
  delay(10);
  // send the value of analog input 0:
  Serial.println(sensorValue);
  
}

