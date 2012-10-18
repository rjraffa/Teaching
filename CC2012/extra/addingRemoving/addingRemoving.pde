float posX []= {-10};
float posY []= {-10};
color value;

void setup(){
 size(600,600);
 smooth();
 noStroke();
  
 value = color(0,0,0);
}

void draw() {
 background(value);
 fill(255);
 
 for (int i = 0; i < posX.length; i++){
  ellipse(posX[i], posY[i], 20, 20); 
 }
 
 if(mousePressed) {
   posX = append(posX, mouseX);
   posY = append(posY, mouseY);
   value = color(0,0,0);
 }
 
 if(keyPressed) {
   if (key == ' ') {
     for(int i = 0; i < posX.length; i++) {
       posX = shorten(posX);
       posY = shorten(posY);
       value = color(255,0,0);
     } 
   }
 }
 
 println(posX.length);
 
}

