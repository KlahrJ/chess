int wKingR, wKingF;

void findKingWhite() {
  int f = 0;
  
  for (int r = 0; r < 8; r++) {//find the white king on the board
    if (board[r][f] == "WK") {
      wKingR = r;
      wKingF = f;
      break;
    }
    
    if (r == 7) {
      f++;
      r = -1;
    }
  }
}

Boolean checkWhitePawn() { //is the white under check by a pawn?
  if(wKingR != 0) {
    if (wKingF < 7) {
      if (board[wKingR-1][wKingF+1] == "BP") { //is there a pawn to the right?
        return false;
      }
    }
     
    if (board[wKingR-1][wKingF-1] == "BP") { //is there a pawn to the left?
      return false;
    }
  }
  //if not in check
  return true;
}

Boolean checkWhiteRook() { //is the king under check by a rook?
  Boolean file = true, rank = true;
  
  for (int f = 0;f < 8; f++) {
    if (board[wKingR][f] == "BR") {//is there a rook on the rank of the  king?
      if(wKingF > f) { //if rook is to the left of the king
        for (int i = 1; i <= abs(wKingF - f);i++) {
          if (board[wKingR][f+i] == "  " ||  board[wKingR][f+i] == "WK") { // checking if the rook is moving through pieces
            rank = false;
          } else {
            rank = true;
            break;
          }
        }
      }
      if (wKingF < f) { // if rook is to the right of the king
        for (int i = 1; i <= abs(wKingF - f) ;i++) {
          if (board[wKingR][f-i] == "  " ||  board[wKingR][f-i] == "WK") { // checking if the rook is moving through pieces
            rank = false;
          } else {
            rank = true;
            break;
          } 
        }
      }
      
      if (!rank) {//if in check
        return false;
      }
    }
  }
  
  for (int r = 0; r < 8;r++) { 
    if (board[r][wKingF] == "BR") {//is there a rook on the file of the king?
      if(wKingR > r) { //if rook is above king
        for (int i = 1; i <= abs(wKingR - r);i++) {
          if (board[r+i][wKingF] == "  " || board[r+i][wKingF] == "WK") { // checking if the rook is moving through pieces
            file = false;
          } else {
            file = true;
            break;
          }
        }
      } 
      if (wKingR < r) { // if rook is below king
        for (int i = 1; i <= abs(wKingR - r);i++) {
          if (board[r-i][wKingF] == "  " ||  board[r-i][wKingF] == "WK") { // checking if the rook is moving through pieces
            file = false;
          } else {
            file = true;
            break;
          }
        }          
      }
      
      if (!file) {
        return false;  
      }
    }
  }
  //if not in check
  return true;
}

Boolean checkWhiteKnight() { //is the king under check by a knight?
  if (wKingR < 7) { //is knight below king?
    if (wKingF < 6) {
      if(board[wKingR+1][wKingF+2] == "BN") {
        return false;
      }
    }
    if (wKingF > 1) {
      if (board[wKingR+1][wKingF-2] == "BN") {
        return false;
      }
    }
  }
  if (wKingR < 6) {
    if (wKingF < 7) {
      if (board[wKingR+2][wKingF+1] == "BN") {
        return false;
      }
    }
    if (wKingR > 0) {
      if (board[wKingR+2][wKingF-1] == "BN") {
        return false;
      }
    }
  }
  
  if (wKingR > 0) { //is knight above king?
    if (wKingF < 6) {
      if (board[wKingR-1][wKingF+2] == "BN") {
        return false;
      }
    }
    if (wKingF > 1) {
      if (board[wKingR-1][wKingF-2] == "BN") {
        return false;
      }
    }
  }
  if (wKingR > 1) {
    if (wKingF < 7) {
      if (board[wKingR-2][wKingF+1] == "BN") {
        return false;
      }
    }
    if (wKingF > 0) {
      if (board[wKingR-2][wKingF-1] == "BN") {
        return false;
      }
    }
  }
  //if not in check
  return true;
}

Boolean checkWhiteBishop() { //is the king under check by a bishop?
  Boolean diagonal = true; 
  int f = 0;
  
  for (int r = 0; r < 8; r++) {
    if (board[r][f] == "BB") { //finding bishop
      if (abs(wKingR - r) == abs(wKingF - f)) { //if bishop is on the same daigonal as king
        for (int i = 1; i <= abs(wKingR - r); i++) {//is there something between the bishop and the king?
          if (wKingR < r && wKingF < f) { //is bishop below and right of king?
            if (board[wKingR+i][wKingF+i] == "  " || board[wKingR+i][wKingF+i] == "BB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          } else if (wKingR < r && wKingF > f) { //is bishop below and left of king?
            if (board[wKingR+i][wKingF-i] == "  " || board[wKingR+i][wKingF-i] == "BB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }         
          } else if (wKingR > r && wKingF < f) { //is bishop above and right of king?
            if (board[wKingR-i][wKingF+i] == "  " || board[wKingR-i][wKingF+i] == "BB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }          
          } else if (wKingR > r && wKingF > f) { //is bishop above and left of king?
            if (board[wKingR-i][wKingF-i] == "  " || board[wKingR-i][wKingF-i] == "BB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          }
        }
        if (!diagonal) {
          return false;
        }
      }
    }
    
    if (r == 7 && f < 7) {
      f++;
      r = 0;
    }
  }
  //if not in check
  return true;
}

Boolean checkWhiteQueen() { //is the king under check by a queen
  Boolean rank = true, file = true, diagonal = true;
  int f = 0;
  
  for (int r = 0; r < 8; r++) {
    if (board[r][f] == "BQ") { //finding queen
      if (abs(wKingR - r) == abs(wKingF - f)) { //if queen is on the same daigonal as king
        for (int i = 1; i <= abs(wKingR - r); i++) {//is there something between the queen and the king?
          if (wKingR < r && wKingF < f) { //is queen below and right of king?
            if (board[wKingR+i][wKingF+i] == "  " || board[wKingR+i][wKingF+i] == "BQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          } else if (wKingR < r && wKingF > f) { //is queen below and left of king?
            if (board[wKingR+i][wKingF-i] == "  " || board[wKingR+i][wKingF-i] == "BQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }         
          } else if (wKingR > r && wKingF < f) { //is queen above and right of king?
            if (board[wKingR-i][wKingF+i] == "  " || board[wKingR-i][wKingF+i] == "BQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }          
          } else if (wKingR > r && wKingF > f) { //is queen above and left of king?
            if (board[wKingR-i][wKingF-i] == "  " || board[wKingR-i][wKingF-i] == "BQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          }
        }
        if (!diagonal) {
          return false;
        }
      }
      if (wKingR == r) { //if queen is on the same rank as the king
        if(wKingF > f) { //if queen is to the left of the king
          for (int i = 1; i <= abs(wKingF - f);i++) {
            if (board[wKingR][f+i] == "  " ||  board[wKingR][f+i] == "WK") { // checking if the queen is moving through pieces
              rank = false;
            } else {
              rank = true;
              break;
            }
          }
        }
        if (wKingF < f) { // if queen is to the right of the king
          for (int i = 1; i <= abs(wKingF - f) ;i++) {
            if (board[wKingR][f-i] == "  " ||  board[wKingR][f-i] == "WK") { // checking if the queen is moving through pieces
              rank = false;
            } else {
              rank = true;
              break;
            } 
          }
        }
        
        if (!rank) {//if in check
          return false;
        }    
      }
      if (wKingF == f) { // if queen is on the same file as the king
        if(wKingR > r) { //if queen is above king
          for (int i = 1; i <= abs(wKingR - r);i++) {
            if (board[r+i][wKingF] == "  " || board[r+i][wKingF] == "WK") { // checking if the queen is moving through pieces
              file = false;
            } else {
              file = true;
              break;
            }
          }
        } 
        if (wKingR < r) { // if queen is below king
          for (int i = 1; i <= abs(wKingR - r);i++) {
            if (board[r-i][wKingF] == "  " ||  board[r-i][wKingF] == "WK") { // checking if the queen is moving through pieces
              file = false;
            } else {
              file = true;
              break;
            }
          }          
        }
        
        if (!file) {
          return false;  
        }
      }
    }
    
    if (r == 7 && f < 7) {
      f++;
      r = 0;
    }
  }
  //if not in check
  return true;
}

Boolean checkWhiteKing() { //is the king under check by the king?
  findKingBlack();
  
  return !(abs(wKingR - bKingR) < 2 && abs(wKingF - bKingF) < 2 );
}

Boolean checkWhite() {//is king under check?
  findKingWhite();
  if (!checkWhitePawn()) {
    return false;
  }
  if (!checkWhiteRook()) {
    return false;
  }

  if (!checkWhiteKnight()) {
    return false;
  }
  
  if (!checkWhiteBishop()) {
    return false;
  }
  
  if (!checkWhiteQueen()) {
    return false;
  }
  
  if(!checkWhiteKing()) {
    return false;
  }
  //if not under check
  return true;  
}