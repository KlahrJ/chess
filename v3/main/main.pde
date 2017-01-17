String input = "";
Boolean reset = true;

void setup() {
  background(0);
  showBoardTxt();
  showBoardScreen();
  size(420, 520);
}

void draw() {
  //asking player for move
  textSize(25);
  text("Move: " + input, 25, 475);
  if (input.length() == 0 && reset) {
    background(0);
    showBoardScreen();
    textSize(25);
    text("Move: ", 25, 475);
  }
  //doing move
  processMove();
}