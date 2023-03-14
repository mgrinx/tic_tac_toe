import 'package:flutter/material.dart';

typedef Board = List<List<CellState>>;

class Game {
  CellState nextMove = CellState.x;
  final Board board;

  Game(this.board);

  CellState updateCellOnTap(int x, int y) {
    final result = nextMove;
    if (nextMove == CellState.x) nextMove == CellState.o;
    if (nextMove == CellState.o) nextMove == CellState.x;
    board[x][y] = result;
    return result;
  }
}

enum CellState {
  x(Icons.close),
  o(Icons.circle_outlined),
  empty(null),
  outside(null),
  ;

  const CellState(this.icon);

  final IconData? icon;
}
