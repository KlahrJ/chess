Boolean showPrompt = true, whiteTurn = true;

//translates letters to numbers
int file2Num(int pos) {
  switch (input.toLowerCase().charAt(pos)) {
    case 'a':
      return 0;
    case 'b':
      return 1;
    case 'c':
      return 2;
    case 'd':
      return 3;
    case 'e':
      return 4;
    case 'f':
      return 5;
    case 'g':
      return 6;
    case 'h':
      return 7;
    default:
      return -1;
  }
}

//makes sure that the piece the player is refering to is vaild
Boolean validatePiece () {
  char p = input.toLowerCase().charAt(0);
  
  if (p == 'p' || p == 'r' || p == 'n' || p == 'b' || p == 'k' || p == 'q') {
    return true;
  } else {
    return false;
  }
}

Boolean validateMove () {
  String s = input.toLowerCase();
  int r1 = (s.charAt(2) - '1') + 7 - 2 * (s.charAt(2) - '1');
  int f1 = file2Num(1);

  //makes sure that the columns refered to are valid
  if (file2Num(1) < 0 || file2Num(3) < 0) {
    return false;
  }
  
  //making sure that the rows referenced to are valid
  if (s.charAt(2) < '1' || s.charAt(2) > '8' || s.charAt(4) < '1' || s.charAt(4) > '8') {
    return false;
  }

  if (!validatePiece()) {
    return false;
  }

  String p = board[r1][f1].toLowerCase();
  
  //making sure the tile refered to is not empty  
  if (p == "  ") {
    return false;
  }

  // making sure that the piece on the tile and the piece refered to are the same
  if (s.charAt(0) != p.charAt(1)) {
    return false;
  }
  
  //checks if the piece being moved belongs to the player who's turn it is
  if (whiteTurn && p.charAt(0) == 'b' || !whiteTurn && p.charAt(0) == 'w') {
    return false;
  }
  
  if(!pieceRules()) {
    return false;
  }
  
  return true;
}

void doMove() {
  String s = input.toLowerCase(), takenPiece;
  int r1 = (s.charAt(2) - '1') + 7 - 2 * (s.charAt(2) - '1'), r2 = (s.charAt(4) - '1') + 7 - 2 * (s.charAt(4) - '1');
  int f1 = file2Num(1), f2 = file2Num(3);
  
  //moving pieces
  takenPiece = board [r2][f2];
  board[r2][f2] = board[r1][f1];
  board[r1][f1] = "  ";
  
  if ((whiteTurn && !checkWhite()) || (!whiteTurn && !checkBlack())) { //if a player is under check at the end of their turn
    board[r1][f1] = board[r2][f2];
    board[r2][f2] = takenPiece;
    println("check");
    whiteTurn = !whiteTurn;
  }
}

void processMove () {
  //asking player their move
  if (showPrompt) {
    print("move >>: ");
    showPrompt = false;
  }
  if (input.length() == 5) {
    println("");
    showPrompt = true;
    //if move is vailid
    if (validateMove()){
      doMove();
      input = "";
      //switch turn
      whiteTurn = !whiteTurn;
      background(0);
      showBoardTxt();
      showBoardScreen();
    } else {
    println("Invalid Move");
    input = "";
    }
  }
}

void keyTyped() {
  input = input + key;
  print (key);
}