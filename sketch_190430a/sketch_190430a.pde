PImage character;

void setup() {
  size(800, 600);
  background(54, 114, 132);
  character = loadImage("Chicken.png");
}

void draw() {
  image(character, 0, 0);
}