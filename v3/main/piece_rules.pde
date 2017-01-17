Boolean pieceRules() {
  String s = input.toLowerCase();
  int r1 = (s.charAt(2) - '1') + 7 - 2 * (s.charAt(2) - '1'), r2 = (s.charAt(4) - '1') + 7 - 2 * (s.charAt(4) - '1');
  int f1 = file2Num(1), f2 = file2Num(3);
  String p = board[r1][f1].toLowerCase(), l = board[r2][f2].toLowerCase();
  
  if (p.charAt(0) == board[r2][f2].toLowerCase().charAt(0)) {
    return false;
  }
  
  switch(p.charAt(1)) { 
    case 'p':
    //rules for white pawn movement
      if (p.charAt(0) == 'w') {
        //pawn can move up to 2 spaces from start
        if (f1 == f2) {
          if(r1 == 6) {
            if (r1 - r2 > 2) {
              return false;
            } else if (r1 - r2 == 2 && board[r1-1][f1] != "  ") {
              return false;
            }
          //but afterward can only move 1 space from then foward
          } else {
            if (r1-r2 != 1) {
              return false;
            }
          }
          
          if(l != "  ") {
            return false;
          }
        //taking pieces
        } else if (abs(f1 - f2) == 1){
          if (r1 - r2 != 1) {
            return false;
          }
          
          if (l == "  ") {
            return false;
          }
        } else {
          return false;
        }
      }
      
      //rules for black pawns
      if (p.charAt(0) == 'b') {
        //pawn can move up to 2 spaces from start
        if (f1 == f2) {
          if(r1 == 1) {
            if (r2 - r1 > 2) {
              return false;
            } else if (r2 - r1 == 2 && board[r1+1][f1] != "  ") {
              return false;
            }
          //but afterward can only move 1 space from then foward
          } else {
            if (r2-r1 != 1) {
              return false;
            }
          }
          
          if(l != "  ") {
            return false;
          }
        //taking pieces
        } else if (abs(f1 - f2) == 1){
          if (r2 - r1 != 1) {
            return false;
          }
          
          if (l == "  ") {
            return false;
          }
        } else {
          return false;
        }
      }

      return true;
    case 'r': //rules for all rooks
      if (f1 == f2) { //if rook is moving vertically //<>//
        if(r1 > r2) { //if rook is moving up
          for (int i = 1; i <= abs(r1 - r2);i++) {
            if (board[r1 - i][f1] != "  ") { // checking if the rook is moving through pieces
              return false;
            }
          }
        } else { // if rook is moving down
          for (int i = 1; i <= abs(r1 - r2) - 1;i++) {
            if (board[r1 + i][f1] != "  ") { // checking if the rook is moving through pieces
              return false;
            }
          }          
        }
        //if rook is not moving through pieces
        return true;
      } else if (r1 == r2) { // if rook is moving horizontally
        if(f1 > f2) { //if rook is moving left
          for (int i = 1; i <= abs(f1 - f2) - 1;i++) {
            if (board[r1][f1 - i] != "  ") { // checking if the rook is moving through pieces
              return false;
            }
          }
        } else { // if rook is moving right
          for (int i = 1; i <= abs(f1 - f2) - 1;i++) {
            if (board[r1][f1 + i] != "  ") { // checking if the rook is moving through pieces
              return false;
            }
          }
        }
        //if rook is not moving through pieces
        return true;
      } else {
        return false;
      }
    case 'n': //rules for all knights
      if (abs(r1 - r2) == 2) {
        return (abs(f1 - f2) == 1);
      } else if (abs(r1 - r2) == 1) {
        return (abs(f1 - f2) == 2);
      } else {
        return false;
      }
    case 'b': //rules for all bishops
      if (abs(r1-r2) != abs(f1-f2)) { //bishops must move diagonally
        return false;
      }
      
      if (r1 > r2 && f1 > f2) { //if bishop is moving up and left
        for (int i = 1;i < abs(r1-r2);i++) {
          if(board[r1 - i][f1 - i] != "  ") { // checking if the bishop is moving through pieces
            return false;
          }
        }
      } else if (r1 > r2 && f1 < f2) { // if bishop is moving up and right
        for (int i = 1;i < abs(r1-r2);i++) {
          if(board[r1 - i][f1 + i] != "  ") { // checking if the bishop is moving through pieces
            return false;
          }
        }
      } else if (r1 < r2 && f1 > f2) { //bishop is moving down and left
        for (int i = 1;i < abs(r1-r2);i++) {
          if(board[r1 + i][f1 - i] != "  ") { // checking if the bishop is moving through pieces
            return false;
          }
        }
      } else if (r1 < r2 && f1 < f2) { //bishop is moving down and left
        for (int i = 1;i < abs(r1-r2);i++) {
          if(board[r1 + i][f1 + i] != "  ") { // checking if the bishop is moving through pieces
            return false;
          }
        }
      }
      //if bishop is not passing through any pieces
      return true;
    case 'k': //rules for all kings
      return (abs(r1 - r2) < 2 && abs(f1 - f2) < 2);
    case 'q': //rules for all queens
      if (r1 == r2) { //if queen is moving horizontally //<>//
        if(f1 > f2) { //if queen is moving left
          for (int i = 1; i <= abs(f1 - f2) - 1;i++) {
            if (board[r1][f1 - i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        } else { // if queen is moving right
          for (int i = 1; i <= abs(f1 - f2) - 1;i++) {
            if (board[r1][f1 + i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        }
        //if queen is not moving through pieces
        return true;
      } else if (f1 == f2) { //if queen is moving vertically
        if(r1 > r2) { //if queen is moving up
          for (int i = 1; i <= abs(r1 - r2);i++) {
            if (board[r1 - i][f1] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        } else { // if queen is moving down
          for (int i = 1; i <= abs(r1 - r2) - 1;i++) {
            if (board[r1 + i][f1] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }          
        }
        //if queen is not moving through pieces
        return true;
      } else if (abs(r1-r2) == abs(f1-f2)) { //if queen is moving diagonally
        if (r1 > r2 && f1 > f2) { //if queen is moving up and left
          for (int i = 1;i < abs(r1-r2);i++) {
            if(board[r1 - i][f1 - i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        } else if (r1 > r2 && f1 < f2) { // if queen is moving up and right
          for (int i = 1;i < abs(r1-r2);i++) {
            if(board[r1 - i][f1 + i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        } else if (r1 < r2 && f1 > f2) { //queen is moving down and left
          for (int i = 1;i < abs(r1-r2);i++) {
            if(board[r1 + i][f1 - i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        } else if (r1 < r2 && f1 < f2) { //queen is moving down and left
          for (int i = 1;i < abs(r1-r2);i++) {
            if(board[r1 + i][f1 + i] != "  ") { // checking if the queen is moving through pieces
              return false;
            }
          }
        }
      //if queen is not passing through any pieces
      return true;
      } else {
        return false;
      }
    default:   //if code reaches here, there was an error
      return false;
  }
}