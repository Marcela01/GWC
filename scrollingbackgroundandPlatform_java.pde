int y= 200;
int x= 100;
boolean moveLeft;
PImage img;
int ex; 
void setup(){
  frameRate(24);
  size(1080,500);
  img = loadImage("https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg");
}
void draw(){
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
  }
    fill(255,0,0);
    rect(x,y,100,40);
    moveRect();
}
   
void moveRect(){
  if(x==100){
    moveLeft=false;
  }
  if(x==width-140){
    moveLeft=true;
  }
  if(moveLeft==true){
    x-=5;
  }
  if(moveLeft==false){
    x+=5;
  }
}
