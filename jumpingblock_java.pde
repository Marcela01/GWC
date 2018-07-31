float playerX = 200;
float playerY = 900;
float gravity = 10;
boolean override = true;
 
void setup() {
  size(1000, 1000);
}
 
void player() {
  fill(255, 0, 0);
  rect(playerX, playerY, 40, 40);
}
void draw() {
  background(200, 200, 200);
  player();
 
  if (override == false) {
    constrain(playerY, 0, 1000);
  }
  if (keyPressed == true) {
    playerY -= 20;
    override = true;
  }
  if (playerY < 900 && keyPressed == false) {
    playerY += gravity;
  }
}
