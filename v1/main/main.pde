char[][] board = {
  {'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'},
  {'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
  {'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'},
  {'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'}
};

void showBoard() {
  println("---------------------------------");
  for (int row = 0; row < 8; row++) {
    for (int col = 0; col < 8; col++) {
      print("| ");
      print(board[row][col]);
      print(' ');
    }
    println("|");
    println("---------------------------------");
  }
}
 //<>//
void setup() {
  showBoard();
  size(320, 240);
  background(0);
}