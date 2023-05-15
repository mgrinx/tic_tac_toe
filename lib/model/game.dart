import 'package:flutter/material.dart';

typedef Board = List<List<CellState>>;
typedef Coordinates = ({int x, int y});


/// A game that holds board value named [board] and the next move value named [nextMove].
///
/// The game updates cell value using method [updateCellOnTap()]
/// The game returns the state of a cell using method [cellState()]
class Game {
  CellState nextMove = CellState.x;
  Coordinates? lastMove;
  final Board board;

  Game(this.board);

  void updateCellOnTap(int x, int y) {
    if (cellState(x, y) == CellState.outside) {
      return;
    }

    final result = nextMove;
    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[x][y] = result;

    lastMove = (x: x, y: y);
  }

  void stepBack() {
    if (lastMove == null) return;

    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[lastMove!.x][lastMove!.y] = CellState.empty;

    lastMove = null;
  }

  CellState cellState(int x, int y) => board[x][y];
}

/// Holds cell state values and icons
enum CellState {
  x(Icons.close),
  o(Icons.circle_outlined),
  empty(null),
  outside(null),
  ;

  const CellState(this.icon);

  final IconData? icon;
}
