PImage bgImg;
PImage soilImg;
PImage groundhogImg;
PImage lifeImg;
PImage soldierImg;
PImage robotImg;

int grid = 80;
int ySoil = grid*2;
int xLifeInterval = 70; 

//random variable
int ranA = floor (random (6)) ;
int ranB = floor (random (6)) ;
int ranC = floor (random (8)) ;

int xSoldier = 0;

//laser variable
int robotLaserPosX = 25;
int robotLaserPosY = 37;
int xLaserPosition = 0;

void setup() {
  size(640, 480, P2D);
  
  // import image
  bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
  image(bgImg, 0, 0);
  image(soilImg, 0, ySoil);
  
  //draw the grass
  fill(124, 204, 25);
  noStroke();
  rect(0, ySoil-15, 640, 15);
  
  //draw the sun
  fill(253, 184, 19); 
  strokeWeight(5);
  stroke(255, 255, 0);
  circle(640-50, 50, 120);
}

void draw() {
if(ranA < 2) {    //set for SoldierLevel
   ranA = ranA+2;
}
if(ranB < 2) {    //set for Robot Y
   ranB = ranB+2;
}
if(ranC < 2) {    //set for Robot X
   ranC = ranC+2;
}

//random variable
int ySoldierLevel = grid * ranA;
int yRobotLevel = grid * ranB;
int xRobot = grid * ranC;

//laser variable
int xLaser = xRobot + robotLaserPosX;
int yLaser = yRobotLevel + robotLaserPosY;

  image(soilImg, 0, ySoil); 
  image(groundhogImg, 640/2-40, grid); //place groundhog at the center groung
  
  //life*3
  image(lifeImg, 10, 10);
  image(lifeImg, 10 + xLifeInterval, 10);
  image(lifeImg, 10 + xLifeInterval * 2, 10); 
  
  image(soldierImg, xSoldier, ySoldierLevel); 
  xSoldier = xSoldier + 2; //set the soldier moving speeds
    
    //set soldier moving cycling
    if(xSoldier>640){
    xSoldier = -80;
    }
  
  xLaserPosition = xLaserPosition + 2;  //set the laser speeds
  int xEnd = xLaser - xLaserPosition;   //set the laser end point
  int xHead = xLaser - 20 - xLaserPosition;   //set the laser start point
  
  stroke(255,0,0);
  strokeWeight(10);
  strokeCap(ROUND);
  line(xEnd, yLaser, xHead, yLaser);
  
  //set the range of laser
  if(xHead + grid * 2 + robotLaserPosX < xLaser){
    xLaserPosition = 0;
    }
    
image(robotImg, xRobot, yRobotLevel);

}
