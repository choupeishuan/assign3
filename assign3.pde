
PImage bg1Img,bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpBarImg;
PImage treasureImg;

float backgroundX,backgroundY; //background
float treasureX,treasureY; //treasure
float enemyX,enemyY; //enemy
float hpBar; //hpBar
float fighterX,fighterY; //fighter
float speed = 5;

int enemyMove;
final int C =0;
final int B =1;
final int A =2;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  
  size(640,480) ; 
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  enemyImg = loadImage("img/enemy.png");
  fighterImg = loadImage("img/fighter.png");
  hpBarImg = loadImage("img/hp.png");
  treasureImg = loadImage("img/treasure.png");
  
  backgroundX=640;
  backgroundY=0;
  treasureX=floor(random(0,601));
  treasureY=floor(random(0,440));
  enemyX=0;
  enemyY=floor(random(0,420));
  hpBar=40;
  fighterX=589;
  fighterY=214.5;
  
}

void draw() {
  
   if(upPressed){
    fighterY-=speed;
  }
  if(downPressed){
    fighterY+=speed;
  }
  if(leftPressed){
    fighterX-=speed;
  }
  if(rightPressed){
    fighterX+=speed;
  }
  
  background(0);
  
  //background
   
  image(bg1Img,backgroundX-640,0);
  image(bg2Img,backgroundY-640,0);
  backgroundX++;
  backgroundX %=1281;
  backgroundY++;
  backgroundY %=1281;
  
  //fighter
  image(fighterImg,fighterX,fighterY);
  
  if(fighterX <= 0){
    fighterX = 0;
  }
  if(fighterX >= 589){
    fighterX = 589;
  }
  if(fighterY <= 0){
    fighterY = 0;
  }
  if(fighterY >= 429){
    fighterY = 429;
  }
  
  //treasure
  image(treasureImg,treasureX,treasureY);
 
  //enemy
  int enemyWidth=61;
  int enemyHeight=61;
  int spacing=5;
  
  switch(enemyMove){
  case C:  
  for(int i=0;i<5;i++){
    image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY);
    enemyX++;
  }
  if (enemyX-4*(enemyWidth+spacing)>width){
    enemyX=-enemyWidth;
    enemyY=floor(random(0,420));
    enemyMove= B;
  }
  break;
  
  case B:
  for(int i=0;i<5;i++){
    image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY+i*enemyHeight);
    enemyX++;
    enemyY %= height-5*enemyHeight;
  }
  if (enemyX-4*(enemyWidth+spacing)>width){
    enemyX=-enemyWidth;
    enemyY=floor(random(0,420));
    enemyMove= A;
  }
  break;
  
  case A:
  for(int i=0;i<5;i++){
    if(i<=2){
      image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY+i*enemyHeight);
      image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY-i*enemyHeight);
    }else{
      image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY+(4-i)*enemyHeight);
      image(enemyImg,enemyX-i*(enemyWidth+spacing),enemyY-(4-i)*enemyHeight);
    }
    enemyX++;
    enemyY %= height-3*enemyHeight;
    if(enemyY-2*enemyWidth<0){
      enemyY=2*enemyWidth;
    }  
  }
  if (enemyX-4*(enemyWidth+spacing)>width){
    enemyX=-enemyWidth;
    enemyY=floor(random(0,420));
    enemyMove= C;
  }
  break;
  }
  
  //hpBar
  fill(255,0,0);
  rect(10,7,hpBar,20);
  image(hpBarImg,5,5);
  
  //score
  if(fighterX <= treasureX+41 && fighterX+51 >= treasureX && fighterY <= treasureY+41 && fighterY+51 >= treasureY){
    treasureX = random(0,600);
    treasureY = random(0,440);
    hpBar+=20;
    if(hpBar > 180){
    hpBar=200;
    hpBar+=0;
    }
   }

}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
       upPressed = true;
       break;
      case DOWN:
       downPressed = true;
       break;
      case LEFT:
       leftPressed = true;
       break;
      case RIGHT:
       rightPressed = true;
       break;
      
    }
  }
}
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
       upPressed = false;
       break;
      case DOWN:
       downPressed = false;
       break;
      case LEFT:
       leftPressed = false;
       break;
      case RIGHT:
       rightPressed = false;
       break;
      
    }
  }

}
