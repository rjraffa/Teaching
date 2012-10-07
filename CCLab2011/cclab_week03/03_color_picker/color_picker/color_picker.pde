/*
 * Color Picker
 *
 * CC Lab Fall 2011
 * by Ryan Raffa
 * 9/12/11
 */

PImage testPhoto;
float[] picValues = new float[664];
float[] clickedValues = new float[300];

int counter;
color currentColor;

void setup() {
  size(1000, 664);
  testPhoto = loadImage("7biennale_art2011_filippo-the-immortals.jpg", "jpg");

  //  In case you want to pull a file from a URL, here is an example
  //  String url = "http://your-image-url-here.jpg";
  //  testPhoto = loadImage(url, "jpg");
}

void draw() {
  image(testPhoto, 0, 0);
  loadPixels();
  currentColor = pixels[mouseX+mouseY*width];
  fill(currentColor);
  rect(mouseX, mouseY, 100, 100);
  
  grabColors();

}

void mouseReleased() {
  if (counter < 300) {
    counter=counter+3;
    clickedValues[counter] = red(currentColor);
    clickedValues[counter+1] = green(currentColor);
    clickedValues[counter+2] = blue(currentColor);
  }
 
   println(counter +" / "+ clickedValues[counter] +" / "+ clickedValues[counter+1] +" / "+ clickedValues[counter+2] );
   
}

void grabColors() {
    //pull the pixel values from image and store them in separate array
  for (int i=0; i<662; i=i+3) {
    //pixels already has all of the image values stored
    color thisPixel = pixels[i+i*width];
    picValues[i] = red(thisPixel);
    picValues[i+1] = green(thisPixel);
    picValues[i+2] = blue(thisPixel);
//    be sure to comment out this println if you want to see the mouseReleased values
//    println(i +" / "+ picValues[i] +" / "+ picValues[i+1] +" / " + picValues[i+2]);
  }
}
