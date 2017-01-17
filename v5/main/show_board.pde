String[][] board = {
  {"BR", "BN", "BB", "BQ", "BK", "BB", "BN", "BR"},
  {"BP", "BP", "BP", "BP", "BP", "BP", "BP", "BP"},
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "},
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "},
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "},
  {"  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "},
  {"WP", "WP", "WP", "WP", "WP", "WP", "WP", "WP"},
  {"WR", "WN", "WB", "WQ", "WK", "WP", "WN", "WR"}
};

//displays pieces on the screen
void showPieces() {
  int x = 0;
  
  for(int y = 0; y < 8; y++){
    if (board[y][x] != " ") {
      switch (board[y][x]) {
        case "WP":
          image(loadImage("White Pawn.png"), x * 50, y * 50);
          break;
        case "WR":
          image(loadImage("White Rook.png"), x * 50, y * 50);
          break;
        case "WN":
          image(loadImage("White Knight.png"), x * 50, y * 50);
          break;
        case "WB":
          image(loadImage("White Bishop.png"), x * 50, y * 50);
          break;        
        case "WK":
          image(loadImage("White King.png"), x * 50, y * 50);
          break;
        case "WQ":
          image(loadImage("White Queen.png"), x * 50, y * 50);
          break;
        case "BP":
          image(loadImage("Black Pawn.png"), x * 50, y * 50);
          break;
        case "BR":
          image(loadImage("Black Rook.png"), x * 50, y * 50);
          break;
        case "BN":
          image(loadImage("Black Knight.png"), x * 50, y * 50);
          break;
        case "BB":
          image(loadImage("Black Bishop.png"), x * 50, y * 50);
          break;        
        case "BK":
          image(loadImage("Black King.png"), x * 50, y * 50);
          break;
        case "BQ":
          image(loadImage("Black Queen.png"), x * 50, y * 50);
          break;
      }
    }
    
    if (y == 7 && x < 7) {
      y = -1;
      x++;
    }
  }
}

//labels the rows and columns on the screen
void labels() {
  textSize(12);
  text('a', 25, 415);
  text('b', 75, 415);
  text('c', 125, 415);
  text('d', 175, 415);
  text('e', 225, 415);
  text('f', 275, 415);
  text('g', 325, 415);
  text('h', 375, 415);
  
  text('1', 405, 375);
  text('2', 405, 325);
  text('3', 405, 275);
  text('4', 405, 225);
  text('5', 405, 175);
  text('6', 405, 125);
  text('7', 405, 75);
  text('8', 405, 25);
}

void showBoardTxt() {
  println("-----------------------------------------");
  for (int col = 0; col < 8; col++) {
    for (int row = 0; row < 8; row++) {
      print("| ");
      print(board[col][row]);
      print(' ');
    }
    println("|");
    println("-----------------------------------------");
  }
}

void showBoardScreen() {
 int w = 0;
 Boolean c = true;
 
 //changing the colors of tiles
  for(int l = 0; w < 50 * 8; l += 50){
    if (c) {
      fill(255);
      c = !c;
    } else {
      fill(160, 82, 45);
      c = !c;
    }
    
    rect(l, w, 50, 50);
    if (l == 50 * 7) {
      l = -50;
      w = w + 50;
      c = !c;
    }
  }
  
  showPieces();
  labels();
}