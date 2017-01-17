int bKingR, bKingF;

void findKingBlack() {
  int f = 0;
  
  for (int r = 0; r < 8; r++) {//find the black king on the board
    if (board[r][f] == "BK") {
      bKingR = r;
      bKingF = f;
      break;
    }
    
    if (r == 7) {
      f++;
      r = -1;
    }
  }
}

Boolean checkBlackPawn() { //is the king under check by a pawn?
  if(bKingR != 7) {
    if (board[bKingR+1][bKingF+1] == "WP") { //is there a pawn to the right?
      return false;
    }
    
    if (bKingF > 0) {
      if (board[bKingR+1][bKingF-1] == "WP") {  //is there a pawn to the left?
        return false;
      }
    }
  }
  //if not in check
  return true;
}

Boolean checkBlackRook() { //is the king under check by a rook?
  Boolean file = true, rank = true;
  
  for (int f = 0;f < 8; f++) {
    if (board[bKingR][f] == "WR") {//is there a rook on the rank of the king?
      if(bKingF > f) { //if rook is to the left of the king
        for (int i = 1; i <= abs(bKingF - f);i++) {
          if (board[bKingR][f+i] == "  " ||  board[bKingR][f+i] == "BK") { // checking if the rook is moving through pieces
            rank = false;
          } else {
            rank = true;
            break;
          }
        }
      }
      if (bKingF < f) { // if rook is to the right of the king
        for (int i = 1; i <= abs(bKingF - f) ;i++) {
          if (board[bKingR][f-i] == "  " ||  board[bKingR][f-i] == "BK") { // checking if the rook is moving through pieces
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
    if (board[r][bKingF] == "WR") {//is there a black rook on the file of the white king?
      if(bKingR > r) { //if rook is above king
        for (int i = 1; i <= abs(bKingR - r);i++) {
          if (board[r+i][bKingF] == "  " || board[r+i][bKingF] == "BK") { // checking if the rook is moving through pieces
            file = false;
          } else {
            file = true;
            break;
          }
        }
      } 
      if (bKingR < r) { // if rook is below king
        for (int i = 1; i <= abs(bKingR - r);i++) {
          if (board[r-i][bKingF] == "  " ||  board[r-i][bKingF] == "BK") { // checking if the rook is moving through pieces
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

Boolean checkBlackKnight() { //is the king under check by a knight?
  if (bKingR < 7) { //is knight below king? //<>//
    if (bKingF < 6) {
      if(board[bKingR+1][bKingF+2] == "WN") {
        return false;
      }
    }
    if (bKingF > 1) {
      if (board[bKingR+1][bKingF-2] == "WN") {
        return false;
      }
    }
  }
  if (bKingR < 6) {
    if (bKingF < 7) {
      if (board[bKingR+2][bKingF+1] == "WN") {
        return false;
      }
    }
    if (bKingR > 0) {
      if (board[bKingR+2][bKingF-1] == "WN") {
        return false;
      }
    }
  }
  
  if (bKingR > 0) { //is knight above king?
    if (bKingF < 6) {
      if (board[bKingR-1][bKingF+2] == "WN") {
        return false;
      }
    }
    if (bKingF > 1) {
      if (board[bKingR-1][bKingF-2] == "WN") {
        return false;
      }
    }
  }
  if (bKingR > 1) {
    if (bKingF < 7) {
      if (board[bKingR-2][bKingF+1] == "WN") {
        return false;
      }
    }
    if (bKingF > 0) {
      if (board[bKingR-2][bKingF-1] == "WN") {
        return false;
      }
    }
  }
  //if not in check
  return true;
}

Boolean checkBlackBishop() { //is the king under check by a bishop?
  Boolean diagonal = true; 
  int f = 0;
  
  for (int r = 0; r < 8; r++) {
    if (board[r][f] == "WB") { //finding bishop
      if (abs(bKingR - r) == abs(bKingF - f)) { //if bishop is on the same daigonal as king
        for (int i = 1; i <= abs(bKingR - r); i++) {//is there something between the bishop and the king?
          if (bKingR < r && bKingF < f) { //is bishop below and right of king?
            if (board[bKingR+i][bKingF+i] == "  " || board[bKingR+i][bKingF+i] == "WB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          } else if (bKingR < r && bKingF > f) { //is bishop below and left of king?
            if (board[bKingR+i][bKingF-i] == "  " || board[bKingR+i][bKingF-i] == "WB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }         
          } else if (bKingR > r && bKingF < f) { //is bishop above and right of king?
            if (board[bKingR-i][bKingF+i] == "  " || board[bKingR-i][bKingF+i] == "WB") { //if there is something between the bishop and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }          
          } else if (bKingR > r && bKingF > f)  //is bishop above and left of king?
            if (board[bKingR-i][bKingF-i] == "  " || board[bKingR-i][bKingF-i] == "WB") { //if there is something between the bishop and the king
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
    
      if (r == 7 && f < 7) {
        f++;
        r = 0;
      }
    }
  //if not in check
  return true;
}

Boolean checkBlackQueen() { //is the king under check by a queen
  Boolean rank = true, file = true, diagonal = true;
  int f = 0;
  
  for (int r = 0; r < 8; r++) {
    if (board[r][f] == "WQ") { //finding queen
      if (abs(bKingR - r) == abs(bKingF - f)) { //if queen is on the same daigonal as king
        for (int i = 1; i <= abs(bKingR - r); i++) {//is there something between the queen and the king?
          if (bKingR < r && bKingF < f) { //is queen below and right of king?
            if (board[bKingR+i][bKingF+i] == "  " || board[bKingR+i][bKingF+i] == "WQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }
          } else if (bKingR < r && bKingF > f) { //is queen below and left of king?
            if (board[bKingR+i][bKingF-i] == "  " || board[bKingR+i][bKingF-i] == "WQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }         
          } else if (bKingR > r && bKingF < f) { //is queen above and right of king?
            if (board[bKingR-i][bKingF+i] == "  " || board[bKingR-i][bKingF+i] == "WQ") { //if there is something between the queen and the king
              diagonal = false;
            } else {
              diagonal = true;
              break;
            }          
          } else if (bKingR > r && bKingF > f) { //is queen above and left of king?
            if (board[bKingR-i][bKingF-i] == "  " || board[bKingR-i][bKingF-i] == "WQ") { //if there is something between the queen and the king
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
      if (bKingR == r) { //if queen is on the same rank as the king
        if(bKingF > f) { //if queen is to the left of the king
          for (int i = 1; i <= abs(bKingF - f);i++) {
            if (board[bKingR][f+i] == "  " ||  board[bKingR][f+i] == "BK") { // checking if the queen is moving through pieces
              rank = false;
            } else {
              rank = true;
              break;
            }
          }
        }
        if (bKingF < f) { // if queen is to the right of the king
          for (int i = 1; i <= abs(bKingF - f) ;i++) {
            if (board[bKingR][f-i] == "  " ||  board[bKingR][f-i] == "BK") { // checking if the queen is moving through pieces
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
      if (bKingF == f) { // if queen is on the same file as the king
        if(bKingR > r) { //if queen is above king
          for (int i = 1; i <= abs(bKingR - r);i++) {
            if (board[r+i][bKingF] == "  " || board[r+i][bKingF] == "BK") { // checking if the queen is moving through pieces
              file = false;
            } else {
              file = true;
              break;
            }
          }
        } 
        if (bKingR < r) { // if queen is below king
          for (int i = 1; i <= abs(bKingR - r);i++) {
            if (board[r-i][bKingF] == "  " ||  board[r-i][bKingF] == "BK") { // checking if the queen is moving through pieces
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

Boolean checkBlackKing() { //is the king under check by the king?
  findKingWhite();
  
  return !(abs(wKingR - bKingR) < 2 && abs(wKingF - bKingF) < 2 );
}

Boolean checkBlack() {//is king under check?
  findKingBlack();
  if (!checkBlackPawn()) {
    return false;
  }
  if (!checkBlackRook()) {
    return false;
  }

  if (!checkBlackKnight()) {
    return false;
  }

  if (!checkBlackBishop()) {
    return false;
  }

  if (!checkBlackQueen()) {
    return false;
  }
  
  if(!checkBlackKing()) {
    return false;
  }
  //if not under check
  return true;  
}