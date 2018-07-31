int y= 200;
int x= 100;
boolean moveLeft;
float x_block=20;
float y_block=700
float ground=700;

void setup(){
    background(255,255,255);
    size(750, 750);
}
    
void draw(){
    background(255, 255, 255);
    fill(0, 0, 0);
    rect(x_block, y_block, 50, 50); // coordinates of our block
    keyPressed();

}
void keyPressed(){
 if(key==CODED){
  if(keyCode == LEFT && 0<x_block){ //left arrow: go left
      x_block -= 5;
   }
  if(keyCode == RIGHT && x_block<700){ //right arrow: go right
      x_block += 5;
  }
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
