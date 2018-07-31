float x_block=20;
float y_block=300;
float ground=300;
float falling = 0;
int y= 200;
int x= 100;
boolean moveLeft;
PImage img;
int ex; 
void setup(){
  frameRate(24);
  size(1080, 500);
  img = loadImage("https://i.pinimg.com/originals/2c/c1/3e/2cc13e6422218aa521474b36346b85f9.jpg");
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

    fill(0, 0, 0);
    if(keyPressed == false){
      falling = 0;
      y_block = ground;
    }
    keyPressed();
    rect(x_block,(y_block+falling), 30, 30); // coordinates of our block

}

void keyPressed(){
 if(key==CODED){
  if(keyCode == LEFT && 0<x_block){ //left arrow: go left
      x_block -= 5;
   }
  if(keyCode == RIGHT){ //right arrow: go right
      x_block += 5;
   }
  if(keyCode == UP && 0<y_block){ //up arrow: jump
   if (falling == -130){ //before the peak, go down a tiny bit
    falling += 5;
   }
   if (falling <= -150){ //if in the air, then go down and right
    x_block += 10;
    falling += 10;
    x_block += 10;
   }
   else{ //going up
     falling -= 20;
   }
  }
 }
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
