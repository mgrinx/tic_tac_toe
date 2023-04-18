import 'game.dart';

/// The name of the default grid.
const initialGridName = 'Classic';

/// List of game boards.
final boardTemplates = <String, Board>{
  initialGridName: [
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.empty],
  ],
  'Almost Classic': [
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.empty],
    [CellState.empty, CellState.empty, CellState.outside],
  ]
};

/// Creates a new board from an existing board template named [boardName].
Board createBoard(String boardName) {
  final template = boardTemplates[boardName]!;
  return List.generate(
    template.length,
    (x) => List.generate(
      template[x].length,
      (y) => template[x][y],
    ),
  );
}
