//global
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
    200, 620, 270, 20, 1
  }
  , 
  {
    525,520,270,20,1
  }
  ,
  {
    200,415,270,20,1
  }
  ,  
  {
    650,330,270,20,1
  }
  ,
  {
    1050,520,270,20,1
  }
  , 
  {
    850,680,100,20,1
  }
  , 
  {
    1450,650,200,20,1
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
      gravity-=10;
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
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
  }

  playerInput();
  blockUpdate();
  playerUpdate();
}
