float ground1=577;
float trix11 = 1760;
float trix33= trix11+25;
float trix22 = (trix11 +trix33)/2;
float ground=279;
float trix1 = 750;
float trix3 = trix1+25;
float trix2 = (trix1 + trix3)/2;
float tritop = 40;
int screen = 0;

int w = 200;
int h = 715;
PImage img;
int ex;

int[][] blocks = {

  //boundary box

  {
    0, h, w, 20, 1
  }
  , 
 
  /*platforms*/
 
  {
    200, 590, 250, 20, 1
  }
  , 
  {
    370, 470, 200, 20, 1
  }
  , 
  {
    590, 330, 300, 20, 1
  }
  , 
  {
    100, 350, 270, 20, 1
  }
  , 
  {
    780, 450, 260, 20, 1
  }
  ,
  {
    1090, 330, 100, 20, 1
  }
  ,   
  {
    1150, 650, 300, 20, 1
  }
  , 
  {
    1400, 500, 220, 20, 1
  }
  ,
  {
    1700, 600, 200, 20, 1
  }
  ,

};

void setup() {
  size(1880, 720);
  frameRate(30);
  img = loadImage("https://cdn2.vectorstock.com/i/1000x1000/17/06/wall-brick-seamless-pattern-black-vector-2361706.jpg");
  
  
}

float psize=50;
float px=20;
float py=100;
float rx=px;
float ry=py;
float pxv=0;
float pyv=0;
float pspeed=5;
float gravity=0;

boolean dead = false;




boolean falling = true;
void blockUpdate() {
  for (int i = 0; i<blocks.length; i++) {

      fill(142, 116, 213);

    if (blocks[i][4]==0) {
    }

    if (px+pxv+psize>blocks[i][0] && px+pxv<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        dead=true;
      }
      pxv=0;
    }

    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+pyv+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        dead=true;
      }

      pyv=0;
      gravity=0;
      falling = false;
    }

    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py+pyv<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        //print("Wowow look at that");
        dead=true;
      }

      pyv=0;
      gravity=0;
    }

    rect(blocks[i][0], blocks[i][1], blocks[i][2], blocks[i][3]);
  }
}



boolean[] keys = new boolean[256];
void keyPressed() {
  keys[keyCode]=true;
};
void keyReleased() {
  keys[keyCode]=false;
};

void playerInput() {
  pxv=0;
  pyv=0;


  if (dead==false) {
    if (keys[UP] && falling==false) {
      gravity-=11;
    }
    if (keys[LEFT]) {
      pxv=-pspeed;
    }
    if (keys[RIGHT]) {
      pxv=pspeed;
    }
  }
  
  if(keys[82]){
    dead=false;
    px=rx;
    py=ry;
  }
  
  pyv+=gravity;
  gravity+=0.5;

  falling = true;
}

void playerUpdate() {
  px+=pxv;
  py+=pyv;
  
  fill(255, 0, 0);
  if(py > height){
    exit();
  }
  fill(255,160,122);
  rect(px, py, psize, psize);
}





void draw() {
  if (screen==0){//game screen
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
  }
keyTyped();
obstacles();
obstacles1();
  }
      
  playerInput();
  blockUpdate();
  playerUpdate();

  if(screen==1){ //losing screen
    background(255);
    fill(0);
    textSize(24);
    String a = "You weren't able to make it past this obstacle, and woke up in an emergency room. The next morning, you were admited into Ingalls Memorial Hospital's Inpatient Psychiatry Care. After being discharged, you were set up with a therapist. And now, even though every day is battle to keep yourself alive, you keep fighting. (Press ENTER)";
    text(a, 360, 265, 700, 470);
    if(keyCode == ENTER){
      screen=0;
    }}
  }
void obstacles(){
  fill(244, 191, 66);
  noStroke();
  triangle(trix1, ground+50, trix2, ground-tritop, trix3,ground+50); //obstacle
  if((ground+5)==trix1 || px==trix3){ //if hit, go to losing screen
    screen = 1;
  }
} 
void obstacles1(){
  fill(244, 191, 66);
  noStroke();
  triangle(trix11, ground1+50, trix22, ground1-tritop, trix33,ground1+50); //obstacle
  if((ground1+5)==trix11 || px==trix33){ //if hit, go to losing screen
    screen = 1;
  }
} 
