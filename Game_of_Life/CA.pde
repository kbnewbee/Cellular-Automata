class CA {

  float x, y, w;
  int state;
  int prev;

  CA(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;

    state = int(random(2));
    //state = 1;
    prev = state;
  }

  void savePrev() {
    prev = state;
  }

  void newState(int s) {
    state = s;
  }

  void display() {
    if (prev == 0 && state == 1) fill(0, 0, 255);
    else if (state == 1) fill(0);
    else if (prev == 1 && state == 0) fill(255, 0, 0);
    else fill(255); 
    stroke(0);
    rect(x, y, w, w);
  }
}
