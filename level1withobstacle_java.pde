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
    0,0,1,720,1
  }
  ,
 
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
  {
    1945,460,10,500,1
  }
  ,

};

void setup() {
  size(1880, 720);
  frameRate(32);
  img = loadImage("background.jpg");
  
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
boolean relief1 = false;
boolean relief2 = false;
boolean relief3 = false;

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
    screen=4;
  }
  fill(152,204,255);
  rect(px, py, psize, psize);
}





void draw() {
  noStroke();
  if (screen==1){//game screen
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
}
keyTyped();
end();
    story();
  if (relief1==false){
    relief1();
  }
  if (relief2==false){
    relief2();
  }
  if (relief3==false){
    relief3();
  }

  
//if they have been hit

  if (relief1==true){
    noFill();
    obstacles1();
  }
  if (relief2==true){
    noFill();
    obstacles2();
  }
  if (relief3==true){
    noFill();
    obstacles3();
  }
   
  }
      
  playerInput();
  blockUpdate();
  playerUpdate();
    if(screen==5){ //losing screen
  
    background(0); //PLACEHOLDER
    
    if(keys[ENTER]){  //resets to playing screen
      px=20;
      py=100;
      relief1 = false;
      relief2 = false;
      relief3 = false;
      screen=0;
    }}
  
  if(screen==2){ //losing screen
    background(0);
    fill(255);
    textSize(24);
    String lose1 = "You weren't able to make it past this obstacle, and woke up in an emergency room. The next morning, you were admited into a psychiatric hospital. After being discharged, you were set up with a therapist. And now, even though every day is battle to keep yourself alive, you keep fighting. (Press ENTER)";
    text(lose1, 540, 260, 700, 470);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
      relief1 = false;
      relief2 = false;
      relief3 = false;
    }
  }
  if(screen==4){ //losing screen if you fall of the screen
    background(0);
    fill(255);
    textSize(24);
    String lose2 = "You fell off the screen and woke up in an emergency room. The next morning, you were admited into a psychiatric hospital. After being discharged, you were set up with a therapist. And now, even though every day is battle to keep yourself alive, you keep fighting. (Press ENTER)";
    text(lose2, 540, 260, 700, 470);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
      relief1 = false;
      relief2 = false;
      relief3 = false;
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
      relief1 = false;
      relief2 = false;
      relief3 = false;
  }
  }
  if(screen==3){
    background(153,51,255);
    fill(255);
    textSize(25);
    String b = "You thought getting help would fix you. However, this was only the beginning. You would relapse countless times, lose friends, and lose hope. But each time, you picked yourself back up and kept going. Recovery has been a series of ups and downs, but you spend every second of every day fighting to survive. And guess what? You’re winning. (PRESS ENTER TO RESTART)";
    text(b, 450, 260, 1000, 470);
    if(keys[ENTER]){ 
      px=20;
      py=100;
      screen=1;
      relief1 = false;
      relief2 = false;
      relief3 = false;
  }}}
    
void obstacles1(){
  fill(244, 191, 66);
  noStroke();
  triangle(750, 331, 762.5, 239, 775, 331); //obstacle
  if(750<=px+50 && px<=775 && 239<=py && py<=331){ //if hit, go to losing screen
    screen = 2;
  }
} 

void obstacles2(){
  fill(244, 191, 66);
  noStroke();
  triangle(1180, 620, 1200, 485, 1230, 620); //obstacle
  if(1180<=px+50 && px<=1230 && 480<=py && py<=620){ //if hit, go to losing screen
    screen = 2;
  }
} 

void obstacles3(){
  fill(244, 191, 66);
  noStroke();
  triangle(1760, 602, 1772.5, 537, 1785, 602); //obstacle
  if(1760<=px+50 && px<=1785 && 537<=py && py<=602){ //if hit, go to losing screen
    screen = 2;
  }
} 
void end(){
 fill(204,255,153);
 noStroke();
 rect(1870, 500, 15,120);
 if(1860.5<=px && px<=1877.5 && 440<=py && py<=560){
   screen = 3;
 }
}
void relief1(){
  fill(255, 40, 40);
  rect(400, 450, 20, 20);
  if(340<=px && px<=420 && 410<=py && 470>=py){ //if hit, activate obstacle 1
    relief1=true;
  }
}

void relief2(){
  fill(255, 40, 40);
  rect(800, 310, 20, 20);
  if(740<=px && px<=820 && 270<=py && 330>=py){ //if hit, activate obstacle 2
    relief2=true;
  }  
}

void relief3(){
  fill(255, 40, 40);
  rect(1450, 480, 20, 20);
  if(1390<=px && px<=1470 && 430<=py && 500>=py){ //if hit, activate obstacle 3
    relief3=true;
  }
}

void story(){
  if(0<px && px<200 && py>600){
    textSize(25);
    String one ="About a year ago, you started to have days where for a few hours, you felt sad or empty, but for no reason."; 
    text(one, 190, 70, 1690, 470);
  }
  if(200<px && px<340 && py>400){
    textSize(25);
    String two ="Gradually, and seemingly out of nowhere, hours became days, weeks, and finally months.";
    text(two, 190, 70, 1690, 470);
  }
  if(100<px && px<540 && py<400){
    textSize(25);
    String three ="You tried something that you thought might make you feel better. And it did--you got a rush.";
    text(three, 190, 70, 1690, 470);
  }
  if(540<px && px<740){
    textSize(25);
    String four ="But no matter how many times you tried, you were never able to get that same rush a second time.";
    text(four, 190, 70, 1690, 470);
  }
  if(740<px && px<1040){
    textSize(25);
    String five = "You kept persisting, and soon enough, it started to control you. You turned to it at least once a day, in higher and higher amounts.";
    text(five, 190, 70, 1690, 470);
  }
  if(1040<px && px<1390){
    textSize(25);
    String six = "You felt like you were nothing without it, that you needed it to survive. You truly believed that it was all you were, and ever would be.";
    text(six, 190, 70, 1690, 470);
  }
  if(1390<px && px<1870){
    textSize(25);
    String seven = "But deep down, you knew it was causing more harm than good, and so you sought out help. ";
    text(seven, 190, 70, 1690, 470);
  }
}
