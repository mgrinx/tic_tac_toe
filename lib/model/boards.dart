import 'game.dart';

final boardTemplates = <String, Board>{
  'Classic': [
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
