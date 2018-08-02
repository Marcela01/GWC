void setup() {
  size(700, 700);
}
 
void draw() {
  for (int i=0; i<6; i++) {
    rect(random(0, width), random(110, height-60), 
    random(20, 130), random(20, 60));
  } // for
  noLoop();
} // func 
//
