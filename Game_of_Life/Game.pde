class Game {

  int w =5;
  int cols, rows;
  CA[][] board;

  Game() {
    cols = width/w;
    rows = height/w;
    board = new CA[cols][rows];
    init();
  }

  void init() {
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        board[i][j] = new CA(i*w, j*w, w);
      }
    }
    board[cols/2][rows/2].state = 1;
  }

  void gen() {
    for (int x=0; x<cols; x++) {
      for (int y=0; y<rows; y++) {
        board[x][y].savePrev();
      }
    }

    for (int x=1; x<cols-1; x++) {
      for (int y=1; y<rows-1; y++) {

        int nb = 0;
        for (int k = -1; k<=1; k++) {
          for (int m = -1; m<=1; m++) {
            nb += board[x+k][y+m].prev;
          }
        }

        nb -= board[x][y].prev;
        if      ((board[x][y].state == 1) && (nb <  2)) board[x][y].newState(0);           // Loneliness
        else if ((board[x][y].state == 1) && (nb >  3)) board[x][y].newState(0);           // Overpopulation
        else if ((board[x][y].state == 0) && (nb == 3)) board[x][y].newState(1);
      }
    }
  }

  void display() {
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        board[i][j].display();
      }
    }
  }
}
