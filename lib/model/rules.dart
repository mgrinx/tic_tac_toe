/// Holds game rules for different game variations
const gameRules = <String, String>{
  'Traditional':
      'The first player places an X in any square on the board. Players take turns placing an X or an O in one of the squares as in traditional tic-tac-toe. The first player to get three-in-a-row vertically, horizontally, or diagonally wins.',
  'Four-in-a-row':
      'In Four-in-a-row tic-tac-toe, the first player to get four-in-a-row vertically, horizontally, or diagonally wins.',
  'Misere':
      'In misere tic-tac-toe, the player wins if the opponent gets three-in-a-row.',
  'Wild':
      'Choose your number of pieces to get in-a-row, and decide if getting there is winning (positive game) or losing (negative or misere).'
};
