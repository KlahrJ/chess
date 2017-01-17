String input = "", message;
Boolean validMove = true;

void displayText () {
  //asking player for move
  textSize(25);
  if (pawnChange()) {
    message = "Change pawn to: ";
  } else {
    message = "Move: ";
  }
  text(message + input, 25, 465);
  if (input.length() == 0) { //reseting input
    background(0);
    showBoardScreen();
    textSize(25);
    text(message, 25, 465);
  }
  if (!checkWhite() || !checkBlack()) { // if under check
    text("Check", 300, 465);
  }
  if (!validMove) { // if move is invalid
    text("Invalid Move", 25, 495);
  }
}

void setup() {
   size(420, 520);
  background(0);
  showBoardTxt();
  showBoardScreen();
}

void draw() {
  displayText();
  processMove();
}