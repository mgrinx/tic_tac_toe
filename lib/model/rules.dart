/// A class that holds game rules
/// 
/// The class returns general rules using static method [generalRules()]
/// The class returns Fou-in-a-row rules using static method [fourInARowRules()]
/// The class returns Misere rules using static method [misereRules()]
class GameRules {
  static String generalRules() {
    return 'The first player places an X in any square on the board. Players take turns placing an X or an O in one of the squares as in traditional tic-tac-toe. The first player to get three-in-a-row vertically, horizontally, or diagonally wins.';
  }

  static String fourInARowRules() {
    return 'In Four-in-a-row tic-tac-toe, the first player to get four-in-a-row vertically, horizontally, or diagonally wins.';
  }

  static String misereRules() {
    return 'In misere tic-tac-toe, the player wins if the opponent gets three-in-a-row.';
  }
}
