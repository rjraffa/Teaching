PImage TOURGUIDE [] = new PImage [6];

int posX;
int posY;

int counter;

void setup() {
  size(1280,960);
  background(255);
  
  TOURGUIDE[0] = loadImage("darom.jpg");
  TOURGUIDE[1] = loadImage("jeru.jpg");
  TOURGUIDE[2] = loadImage("Kinneret.jpg");
  TOURGUIDE[3] = loadImage("palestine.jpg");
  TOURGUIDE[4] = loadImage("telaviv_beach.jpg");
  TOURGUIDE[5] = loadImage("tzfat.jpg");
  
  posX = 0;
  posY = 0;
  
}

void draw() {
  
  background(255,255);
  
  image(TOURGUIDE[counter], posX, posY);

}

void mousePressed() {
 counter++;
 
 if (counter > 5) {
   counter = 0;  
 }
  
}
