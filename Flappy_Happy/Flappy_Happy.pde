import processing.sound.*;
SoundFile file;
PImage back;
PImage pipeBottom;
PImage pipeTop;
PImage bird;

int x = 200;
int y = 200;
int birdYVelocity = 30;
int upSpeed = 3;

void setup() {
  size(500,750);
  // If data doesn't load
  background(0, 128, 125);
  back = loadImage("flappyBackground.jpg");
  pipeBottom = loadImage("bottomPipe.png");
  pipeTop = loadImage("topPipe.png");
  bird = loadImage("bird.png");
  bird.resize(50,50);
  
  
  
}

void draw() {
  background(back);
  image (pipeBottom,250,375);
  image (pipeTop,250,-130);
  image (bird, x, y); //250, 300
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
     if (y > 0) {
       y = y - upSpeed;
       file = new SoundFile(this, "sad.mp3");
  file.play();
     }
    }
  }
}