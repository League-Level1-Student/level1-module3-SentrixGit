import processing.sound.*;
SoundFile file;
PImage back;
PImage pipeBottom;
PImage pipeTop;
PImage pipeBottom2;
PImage pipeTop2;
PImage bird;

int setX = 50;
int setY = 300;

// Bird stuff var
int x = setX;
int y = setY;
int birdYVelocity = 30;
int upSpeed = 25;
int Gravity = 2;
int setDelay = 10;
int Delay = setDelay;

// Randoms

// PIPES MUST BE SPERATED BY 300 PIXELS //

// Pipe stuff
int upperPipeHeight = (int) random(-100, 200);
int upperPipeHeight2 = (int) random(-100, 200);
int Gap = 30;

// Pipe 1
int setPipeTopY = 375;
int setPipeBottomY = -130;
int storedGravity = Gravity;
int xPipe = 500;

// Pipe 2
int setPipeTopY2 = 375;
int setPipeBottomY2 = -130;
int storedGravity2 = Gravity;
int xPipe2 = 800;

float time = radians(frameCount);

boolean Menu = true;

void setup() {
  size(500,750);
  // If data doesn't load
  background(0, 128, 125);
  back = loadImage("flappyBackground.jpg");
  pipeBottom = loadImage("bottomPipe.png");
  pipeTop = loadImage("topPipe.png");
  pipeBottom2 = loadImage("bottomPipe.png");
  pipeTop2 = loadImage("topPipe.png");
  bird = loadImage("bird.png");
  bird.resize(50,50);
  
  // Set the color mode for rainbow effect
  colorMode(HSB);
  
  
}

void draw() {
  // Pipe control
  if (xPipe <= -25) {
    upperPipeHeight = (int) random(100, 400);
    xPipe = 500;
  }
  
  if (xPipe2 <= -25) {
    upperPipeHeight2 = (int) random(100, 400);
    xPipe2 = 500;
  }
  
  
  background(back);
  textSize(32);
  textAlign(CENTER);
  
  //Don't load objects unless the menu is closed
  if (Menu == false) {
    image (pipeBottom, xPipe, upperPipeHeight + Gap); //250,375
    image (pipeTop, xPipe, upperPipeHeight); // 250,-130
    image (pipeBottom2, xPipe2, 30); //250,375
    image (pipeTop2, xPipe2, upperPipeHeight2); // 250,-130
    image (bird, x, y); //250, 300
    xPipe -= 2;
    xPipe2 -= 2;
    
    // Add gravity
    y = y + Gravity;
    
    // Check if the bird falls to the ground
    if (y > 600) {
     Menu = true; // Change this in the future?
     
     // I forgot to reset the flappy position lol
     x = setX;
     y = setY;
     xPipe = 500;
    }
  }
  
  // Draw text
  if (Menu == true) {
   float time = radians(frameCount);
   fill(255*(.5+.5*cos(time)),255,255);
   text("Press 'space' to play", 250, 350);  
  }
  
  // If moving in air remove delay each frame
  if (Gravity == 0) {
    if (Delay <= 0) {
      Gravity = storedGravity;
      Delay = setDelay; // Reset the Delay Time
    } else {
     Delay--; 
    }
  }
  // Check if the bird falls out of the screen
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
     if (y > 0) {
       y = y - upSpeed;
       file = new SoundFile(this, "Flap.wav");
       file.play();
     }
    }
   
  }
  
  if (keyPressed) {
    if (key == 32) {
      if (Menu == true) {
        Menu = false;
        Delay = setDelay; // Delay time
        //println(Menu);
      } else {
        Gravity = 0;
        y = y - upSpeed;
      }
    }
  }
}

void mousePressed () {
  if (Menu == false) {
   Gravity = 0;
   y = y - upSpeed; 
  }
}