import processing.video.*;
Movie myMovie;
//this bool helps work around the "array out of bounds" error
boolean newFrame;

void setup() {
  size(398, 222);
  myMovie = new Movie(this, "highFive.mov");
  myMovie.loop();
}

void draw() {
  if(newFrame) {
    image(myMovie, 0, 0);
  }
}

void movieEvent(Movie m) {
  m.read();
  newFrame = true;
}
