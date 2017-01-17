String input = "";
Boolean reset = true;

void displayText () {
  //asking player for move
  textSize(25);
  text("Move: " + input, 25, 465);
  if (input.length() == 0 && reset) {
    background(0);
    showBoardScreen();
    textSize(25);
    text("Move: ", 25, 465);
  }
}

void setup() {
  background(0);
  showBoardTxt();
  showBoardScreen();
  size(420, 520);
}

void draw() {
  displayText();
  processMove();
}