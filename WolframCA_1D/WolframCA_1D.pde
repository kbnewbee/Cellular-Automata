CA ca;

void setup() {
  size(800, 800);
  background(255);
  frameRate(30);
  int r[] = {0, 1, 1, 1, 0, 1, 1, 0};
  ca= new CA(r);
}


void draw() {

  ca.display();
  ca.generate();
}
