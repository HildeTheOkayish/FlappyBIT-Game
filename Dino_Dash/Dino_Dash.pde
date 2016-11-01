// create variables
double tileSize = 32;
PImage img;
int orgspeed = 1;
int speed = orgspeed;
float score =0;
// verplaats begin path
int shiftx = -64;
// history of scores
FloatList scores = new FloatList();
// save path x,y 
Tiles [][] test = new Tiles[60][4];
PImage [] images = new PImage[8];
PImage playerImg; 
Player player = new Player();


void setup() {
  frameRate(60);
  size(800, 800);

  // Images must be in the "data" directory to load correctly
  img = loadImage("basic_tile.png");
  playerImg = loadImage("player.png");
  images[0] = loadImage("basic_tile.png");
  images[1] = loadImage("basic_tile2.png");
  images[2] = loadImage("basic_tile3.png");
  images[3] = loadImage("basic_tile4.png");
  images[7] = loadImage("basic_tile5.png");//7
  images[5] = loadImage("basic_tile.png");
  images[6] = loadImage("basic_tile.png");
  images[4] = loadImage("basic_tile2.png");
  //  //for (int i = 0; i < images.length ; i++) {
  //  images[i].resize(128, 0);
  //}

  start();
}

boolean[][] ghost =  new boolean[2][test[0].length];
void start() {
  if (score != 0) {
    scores.append(score);
  }

  for (int i = 0; i < ghost[0].length; i++) {
    ghost[0][i] = true;
    ghost[1][i] = true;
  }

  speed = orgspeed;
  score =0;
  for (int i = 0; i < images.length-2; i++) {
    images[i] = images[0];
  }
  for (int i = 0; i < test.length; i++) {
    for (int i2 = 0; i2 < test[i].length; i2++) {
      //println(i2);
      Tiles fill = new Tiles(images[0], "path");
      test[i][i2] = fill;
    }
  }
}

int x = 0;
int y = 0;
int xmove = 0;
int ymove = 0;

void draw() {
  score += 0.001 * speed;

  background(0, 200, 0);
  fill(30, 140, 250);
  quad(0, 0, 0, 225, width, height-175, width, 0);
  fill(0, 102, 153);  
  textSize(32);
  text(score, 10, 30); 
  for (int i = 0; i < scores.size(); i++) {
    fill(0, 102, 153);  
    textSize(16);
    text(scores.get(i), width - 130, 16 + 16 * i);
  }
  drawCity();
}

void drawCity() {



  while (y< test[0].length) {
    while (x< test.length) {

      img = test[x][y].tileImg;

      image(img, x * (float)(tileSize/2)  + xmove + shiftx, y * (float)(tileSize/2) + x * (float)(tileSize/4) + ymove +175);

      if (y > -1 && y < test[0].length && x > 25 - (y-15) && x < 27 - (y-15) && player.y == y) {
        if (!player.action(x, y)) {
          start();
        }

        image(playerImg, x * (float)(tileSize/2) + shiftx, y * (float)(tileSize/2) + x * (float)(tileSize/4)  +175);
      }

      x ++;
    }
    x=0;
    y++;
  }
  y=0;
  xmove+= 2 * speed;
  ymove+= 1 * speed;
  if (xmove >= (tileSize/2)) {
    xmove = 0;
    ymove = 0;

    for (int i = test.length-1; i > 0; i--) {
      for (int i2 = 0; i2 < test[i-1].length; i2++) {
        test[i][i2] = test[i-1][i2];
      }
    }
    DrawPath();
  }
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) player.keyarr[0] = true;
    if (keyCode == RIGHT) player.keyarr[1] = true;

    if (keyCode == DOWN) start();
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) player.keyarr[0] = false;
    if (keyCode == RIGHT) player.keyarr[1] = false;
  }
}