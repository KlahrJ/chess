int pawnR, pawnF;

Boolean pawnChange () { 
  for (int i = 0; i < 8; i++) {
    if (whiteTurn) {
      if (board[0][i] == "WP") { // if there is a pawn at the end of the board
        pawnR = 0;
        pawnF = i;
        return true;
      }
    } else {
      if (board[7][i] == "BP") { // if there is a pawn at the end of the board
        pawnR = 7;
        pawnF = i;
        return true;
      }
    }
  }
  return false; // if not
}

int changePieceInput() {
  switch(input.toLowerCase()) {
   case "r":
     return 0;
   case "n":
     return 1;
   case "b":
     return 2;
   case "q":
     return 3;
   default:
     return -1;
  }
}

void changePiece() {
  if (whiteTurn) {
    switch (changePieceInput()) { 
      case 0:
        board[pawnR][pawnF] = "WR";
        break;
      case 1:
        board[pawnR][pawnF] = "WN";
        break;
      case 2:
        board[pawnR][pawnF] = "WB";
        break;
      case 3: 
        board[pawnR][pawnF] = "WQ";
        break;
    }
  } else {
    switch (changePieceInput()) { 
      case 0:
        board[pawnR][pawnF] = "BR";
        break;
      case 1:
        board[pawnR][pawnF] = "BN";
        break;
      case 2:
        board[pawnR][pawnF] = "BB";
        break;
      case 3:
        board[pawnR][pawnF] = "BQ";
        break;
    }  
  }
}