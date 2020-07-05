class CA {

  int gen;
  int[] cells;

  //int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0}; //90
  //int[] ruleset = {0, 1, 1, 1, 1, 0, 0, 0}; //30
  //int[] ruleset = {1, 0, 1, 1, 0, 1, 1, 0}; //109
  //int[] ruleset = {0, 1, 1, 1, 1, 0, 0, 1}; //158
  //int[] ruleset = {1, 1, 0, 0, 1, 0, 0, 1}; //147

  //int[] ruleset = {0, 1, 1, 0, 1, 1, 0, 0}; //54
  //int[] ruleset = {0, 1, 1, 1, 1, 1, 0, 0}; //62  
  //int[] ruleset = {1, 0, 0, 1, 1, 1, 0, 0}; //57
  //int[] ruleset = {1, 0, 1, 0, 1, 1, 0, 1}; //181
  int[] ruleset = {1, 0, 0, 1, 0, 1, 1, 0}; //105



  CA(int[] r) {
    cells = new int[width/10];
    for (int i=0; i<cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    gen = 0;
  }

  void generate() {
    int nextgen[] = new int[cells.length];

    for (int i=1; i<cells.length-1; i++ ) {

      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    gen++;
  }

  int rules(int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return ruleset[7];
    if (a == 1 && b == 1 && c == 0) return ruleset[6];
    if (a == 1 && b == 0 && c == 1) return ruleset[5];
    if (a == 1 && b == 0 && c == 0) return ruleset[4];
    if (a == 0 && b == 1 && c == 1) return ruleset[3];
    if (a == 0 && b == 1 && c == 0) return ruleset[2];
    if (a == 0 && b == 0 && c == 1) return ruleset[1];
    if (a == 0 && b == 0 && c == 0) return ruleset[0];
    return 0;
  }

  void display() {

    for (int i=0; i<cells.length; i++ ) {
      if (cells[i] == 1) fill(0);
      else fill(255);
      noStroke();
      rect(i*10, gen*10, 10, 10);
    }
  }
}
