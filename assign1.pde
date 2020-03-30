PImage bgImg;
PImage soilImg;
PImage groundhogImg;
PImage lifeImg;
PImage soldierImg;
PImage robotImg;

int grid = 80;
int skyToGround  = grid*2; // sky to ground distancedistance
int xLifeInterval = 70; //x axis life interval
int xSoldier = 0;  //initially on the left side

//random variable
float ranA = floor(random (2, 6));
float ranB = floor(random (2, 6));
float ranC = floor(random (2, 8));
//laser variable
int robotLaserPosX = 25;
int robotLaserPosY = 37;
int xLaserPosition = 0;

void setup() {
  size(640, 480, P2D);
  
  //import image frome file
  bgImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
  //background image
  image(bgImg, 0, 0);  
  //draw the grass
  fill(124, 204, 25);
  noStroke();
  rect(0, skyToGround - 15, 640, 15); 
  //draw the sun
  fill(253, 184, 19); 
  strokeWeight(5);
  stroke(255, 255, 0);
  ellipse(640 - 50, 50, 120, 120);
  //circle(640 - 50, 50, 120); //circle doesn't work on platform
}

void draw() {
  //random place
  float ySoldierLevel = grid * ranA;
  float yRobotLevel = grid * ranB;
  float xRobot = grid * ranC;
  //laser come out point
  float xLaser = xRobot + robotLaserPosX;
  float yLaser = yRobotLevel + robotLaserPosY;

  image(soilImg, 0, skyToGround); //the soil would be renew each time 
  image(groundhogImg, 640/2-40, grid);  //place groundhog at the center groung
  //life*3
  image(lifeImg, 10, 10);
  image(lifeImg, 10 + xLifeInterval, 10);
  image(lifeImg, 10 + xLifeInterval * 2, 10); 
  image(soldierImg, xSoldier, ySoldierLevel);
  xSoldier = xSoldier + 2; //set the soldier moving speeds
    
    //set soldier moving cycling
    if(xSoldier>640){
    xSoldier = -80; //emerge from the left
    }
  
  xLaserPosition = xLaserPosition + 2;  //set the laser speeds
  float xEnd = xLaser - xLaserPosition;   //set the laser end point
  float xHead = xLaser - 20 - xLaserPosition;   //set the laser start point
  
  stroke(255,0,0);   //set the laser color
  strokeWeight(10);    //set the laser weight
  strokeCap(ROUND);   //set the laser cap type
  line(xEnd, yLaser, xHead, yLaser);
  
    //set the range of laser
    if(xHead + grid * 2 + robotLaserPosX < xLaser){
      xLaserPosition = 0;
      }
    
image(robotImg, xRobot, yRobotLevel);

}
