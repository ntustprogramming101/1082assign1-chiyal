PImage bgImg, soilImg, groundhogImg, lifeImg, soldierImg, robotImg;

int grid = 80;
int skyToGround  = grid*2; // sky to ground distancedistance
int xLifeInterval = 70; //x axis life interval
int xSoldier;

//laser variable
int robotLaserPosX = 25;
int robotLaserPosY = 37;
int xLaserSpeed = 0;

//random place
float ySoldierLevel = grid * floor(random (2, 6));
float yRobotLevel = grid * floor(random (2, 6));
float xRobot = grid * floor(random (2, 8));

//laser come out point
float xLaserR = xRobot + robotLaserPosX;
float xLaserL = xRobot + robotLaserPosX;
float laserNull = xRobot + robotLaserPosX;;
float yLaser = yRobotLevel + robotLaserPosY;

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
  
  //life*3
  image(lifeImg, 10, 10);
  image(lifeImg, 10 + xLifeInterval, 10);
  image(lifeImg, 10 + xLifeInterval * 2, 10); 

}

void draw() {

  image(soilImg, 0, skyToGround); //the soil would be renew each time 
  image(groundhogImg, 640/2-40, grid);  //place groundhog at the center groung

  image(soldierImg, xSoldier, ySoldierLevel);
  xSoldier = xSoldier + 2; //set the soldier moving speeds
    
    //set soldier moving cycle
    if(xSoldier>640){
    xSoldier = -80; //emerge from the left
    }

  stroke(255,0,0);   //set the laser color
  strokeWeight(10);    //set the laser weight
  strokeCap(ROUND);   //set the laser cap type
  line(xLaserL, yLaser, xLaserR, yLaser);
   
  xLaserL = xLaserL - 2;  //set the laser speeds
  
    //set the laser length
    if( xLaserL <= xLaserR - 40){
     xLaserR = xLaserR - 2;
    } 
    //set the laser cycle
    if( xLaserL <= xRobot - robotLaserPosX - grid*2 ){
     xLaserR = laserNull;
     xLaserL = laserNull;
    }

image(robotImg, xRobot, yRobotLevel);
}
