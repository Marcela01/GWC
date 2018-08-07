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
    1070, 620, 300, 20, 1
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
  frameRate(32);
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
    screen=1;
  }
  fill(152,204,255);
  rect(px, py, psize, psize);
}





void draw() {
  if (screen==1){//game screen
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
  }
keyTyped();
obstacles1();
obstacles2();
obstacles3();
end();
  }
      
  playerInput();
  blockUpdate();
  playerUpdate();

  if(screen==2){ //losing screen
    background(0);
    fill(255);
    textSize(24);
    String a = "You weren't able to make it past this obstacle, and woke up in an emergency room. The next morning, you were admited into Ingalls Memorial Hospital's Inpatient Psychiatry Care. After being discharged, you were set up with a therapist. And now, even though every day is battle to keep yourself alive, you keep fighting. (Press ENTER)";
    text(a, 360, 265, 700, 470);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
    }
  }
  if(screen==0){
    background(204,204,255);
    fill(0);
    textSize(80);
    String d = "HELP";
    text(d, 830, 180, 700, 470);
    textSize(27);
    String e = "Use the Arrow Keys to move";
    text(e, 760, 290, 700, 470);
    textSize(20);
    String h = "Hi my name is Bleu";
    text(h, 830, 460, 700, 470);
    textSize(20);
    String f = "Press ENTER to start";
    text(f, 830, 490, 700, 470);
    fill(152,204,255);
    rect(900, 400, 55, 55, 7);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
    }
  }
  if(screen==3){
    background(153,51,255);
    fill(255);
    textSize(25);
    String b = "About a year ago, you started to have days where for a few hours, you felt sad or empty for a few hours, for no reason. Gradually, and seemingly out of nowhere, hours became days, weeks, and finally months. You tried something that you thought might make you feel better. And it did--you got a rush. But no matter how many times you tried, you were never able to get that same rush a second time. You kept persisting, and soon enough, it started to control you. You turned to it at least once a day, in higher and higher amounts. You felt like you were nothing without it, that you needed it to survive. You truly believed that it was all you were, and ever would be. But deep down, you knew it was causing more harm than good, and so you sought out help. You thought getting help would fix you. However, this was only the beginning. You would relapse countless times, lose friends, and lose hope. But each time, you picked yourself back up and kept";
    String c = "going. Recovery has been a series of ups and downs, but you spend every second of every day fighting to survive. And guess what? You’re winning.(PRESS ENTER TO RESTART)";
    text(b, 340, 115, 1000, 470);
    text(c, 340, 575, 1000, 470);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
    }}}
    
void obstacles1(){
  fill(244, 191, 66);
  noStroke();
  triangle(750, 331, 762.5, 239, 775, 331); //obstacle
  if(750<=px+50 && px<=775 && 239<=py && py<=331){ //if hit, go to losing screen
    screen = 1;
  }
} 

void obstacles2(){
  fill(244, 191, 66);
  noStroke();
  triangle(1180, 620, 1200, 485, 1230, 620); //obstacle
  if(1180<=px+50 && px<=1230 && 480<=py && py<=620){ //if hit, go to losing screen
    screen = 1;
  }
} 

void obstacles3(){
  fill(244, 191, 66);
  noStroke();
  triangle(1760, 602, 1772.5, 537, 1785, 602); //obstacle
  if(1760<=px+50 && px<=1785 && 537<=py && py<=602){ //if hit, go to losing screen
    screen = 1;
  }
} 
void end(){
 fill(204,255,153);
 noStroke();
 rect(1870, 500, 15,120);
 if(1860.5<=px && px<=1877.5 && 440<=py && py<=560){
   screen = 2;
 }
}
