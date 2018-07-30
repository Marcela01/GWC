PImage img;
int x; 
void setup(){
size(1080,500);
img = loadImage("https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg");
}
void draw() {
  // NB image is wider than screen
  int x = frameCount % img.width;
  copy(img, x, 0, img.width, height, 0, 0, img.width, height);
  int x2 = img.width - x;
  if (x2 < width) {
    copy(img, 0, 0, img.width, height, x2, 0, img.width, height);
  }
}
