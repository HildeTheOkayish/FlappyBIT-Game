Tiles tile;
DrawPath path;
double tileSize = 128;
PImage img;
int speed = 2;

Tiles [][] test = new Tiles[21][29];
  PImage [] images = new PImage[8];
import java.awt.Frame;
import java.awt.Color;
void setup() {
  
  //frame.setLocation(
  //                  100,10
  //              );
 //fra  me.setVisible(true);
 frameRate(60);
  //frameRate(2147483647);
  size(1920,1080);
  // Images must be in the "data" directory to load correctly
  img = loadImage("basic_tile.png");

  images[0] = loadImage("basic_tile.png");
  images[1] = loadImage("basic_tile2.png");
  images[2] = loadImage("basic_tile3.png");
  images[3] = loadImage("basic_tile4.png");
  images[7] = loadImage("basic_tile5.png");
  images[5] = loadImage("basic_tile.png");
  images[6] = loadImage("basic_tile.png");
  images[4] = loadImage("basic_tile2.png");
//  for (int i = 0; i < images.length ; i++) {
  // images[i].resize(128, 0);
  //}
    for (int i = 0; i < test.length ; i++) {
      for (int i2 = 0; i2 < test[i].length ; i2++) {
        //println(i2);
      Tiles fill = new Tiles(images[int(random(images.length))], "test");
      test[i][i2] = fill;
    }
  }
  
}
int x = 0;
int y = 0;
int xmove = 0;
int ymove = 0;
int framecount =0;
float framePerMillisec = 1000/ 60;
void draw() {
 
 // while(framePerMillisec * framecount < millis()){
 //    framecount++;
    drawCity();
  /* 
    println(framePerMillisec * framecount);
    println("f");
  }
  framecount++;
  drawCity();
   println( millis());
  println( "m");
*/
}

void drawCity(){
    
 background(0,0,0);
  
  while(y< test[0].length){
    while(x< test.length){
       
        img = test[x][y].tileImg;
       //if(int(random(1601)) == 1){
       // test[x][y] = images[7]; 
       //}
      image(img, x * (float)(tileSize/2)  + xmove, y * (float)(tileSize/2) + x * (float)(tileSize/4) + ymove -175);
      if(y > 15 && y < 20 && x > 15 - (y-15) && x < 20 - (y-15)){
        noStroke();
        fill(255,255,255,250);
       ellipse(  x * (float)(tileSize/2) - (float)tileSize ,y * (float)(tileSize/2) + x * (float)(tileSize/4)  -160,28,16);
       
      }
    //else{ image(img, x * 16 - 32 + xmove, y *16 + x * 8 + ymove -175);}
      x ++;
    }
    x=0;
    y++;
  }
  y=0;
  xmove+= 2 * speed;
  ymove+= 1 * speed;
  if(xmove >= (tileSize/2)){
   xmove = 0;
   ymove = 0;
     for (int i = test.length-1; i > 0; i--) {
        for (int i2 = 0; i2 < test[i-1].length ; i2++) {
    test[i][i2] = test[i-1][i2];
        }

  }
        for (int i2 = 0; i2 < test[0].length ; i2++) {
        //println(i2);
        Tiles fill = new Tiles(images[int(random(images.length))], "test");
      test[0][i2] = fill;
      
    }
  }
  
}