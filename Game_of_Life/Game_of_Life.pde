
Game gol;

void setup() {
  size(800, 800, P2D);
  gol = new Game();
}


void draw() {

  background(255);
  gol.gen();
  gol.display();
}

void mousePressed() {
  gol.init();
}
