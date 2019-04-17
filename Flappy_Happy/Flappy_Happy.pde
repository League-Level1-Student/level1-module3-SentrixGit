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
int upSpeed = 50;
int Gravity = 4;
int setDelay = 10;
int Delay = setDelay;

// Randoms

// PIPES MUST BE SPERATED BY 300 PIXELS //

// Pipe stuff
int upperPipeHeight = (int) random(-200, 0);
int upperPipeHeight2 = (int) random(-200, 0);
int Gap = 150;
int speedUp = 2000; // Default is 2000

// Pipe 1
int setPipeTopY = 375;
int setPipeBottomY = -130;
int storedGravity = Gravity;
int pipeX = 500;

// Pipe 2
int setPipeTopY2 = 375;
int setPipeBottomY2 = -130;
int storedGravity2 = Gravity;
int pipeX2 = 800;

float time = radians(frameCount);

boolean Menu = true;

void setup() {
  frameRate(60);
  size(500, 750);//500,750
  // If data doesn't load
  background(0, 128, 125);
  back = loadImage("flappyBackground.jpg");
  pipeBottom = loadImage("bottomPipe.png");
  pipeTop = loadImage("topPipe.png");
  pipeBottom2 = loadImage("bottomPipe.png");
  pipeTop2 = loadImage("topPipe.png");
  bird = loadImage("bird.png");
  bird.resize(50, 50);

  // Set the color mode for rainbow effect
  colorMode(HSB);
  file = new SoundFile(this, "Song.mp3");
  file.play();
}

void draw() {
  intersectsPipes();

  // Pipe control
  if (pipeX <= -25) {
    upperPipeHeight = (int) random(-200, 0);
    pipeX = 500;
  }

  if (pipeX2 <= -25) {
    upperPipeHeight2 = (int) random(-200, 0); 
    pipeX2 = 500;
  }


  background(back);
  textSize(32);
  textAlign(CENTER);

  //Don't load objects unless the menu is closed
  if (Menu == false) {
    image (pipeBottom, pipeX, upperPipeHeight + 400 + Gap); //250,375
    image (pipeTop, pipeX, upperPipeHeight); // 250,-130
    image (pipeBottom2, pipeX2, upperPipeHeight2 + 400 + Gap); //250,375
    image (pipeTop2, pipeX2, upperPipeHeight2); // 250,-130
    image (bird, x, y); //250, 300
    pipeX -= speedUp/1000;
    pipeX2 -= speedUp/1000;

    if (speedUp > 10000) {
      speedUp += 3;
    }

    // Add gravity
    y = y + Gravity;

    // Check if the bird falls to the ground
    if (y > 600) {
      Menu = true; // Change this in the future?

      // I forgot to reset the flappy position lol
      x = setX;
      y = setY;
      pipeX = 500;
      pipeX2 = 800;
    }
  }

  // Draw text
  if (Menu == true) {
    float time = radians(frameCount);
    fill(255*(.5+.5*cos(time)), 255, 255);
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

  if (keyPressed) {
    if (key == 101) {
      if (Menu == true) {
        Menu = false;
        Delay = setDelay;

        frameRate(120);
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

void intersectsPipes() {
  println(pipeX);
  if (y <= upperPipeHeight + 400 && y >= upperPipeHeight && pipeX <= 50 && pipeX >= 10) { 
    Menu = true;
    x = setX;
    y = setY;
    pipeX = 500;
    pipeX2 = 800;

  } else if (y <= upperPipeHeight2 + 400 && y >= upperPipeHeight2 && pipeX2 <= 50 && pipeX2 >= 10) { 
    Menu = true;
    x = setX;
    y = setY;
    pipeX = 500;
    pipeX2 = 800;

  } else if (y <= upperPipeHeight2 + 800 + Gap && y >= upperPipeHeight2 && pipeX2 <= 50 && pipeX2 >= 10) { 
    Menu = true;
    x = setX;
    y = setY;
    pipeX = 500;
    pipeX2 = 800;

  }
}