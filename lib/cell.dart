import 'package:flutter/material.dart';

import 'model/game.dart';

class Cell extends StatefulWidget {
  const Cell(CellState s, int i, {super.key});

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  CellState _state = CellState.x;
  static const _size = 40.0;

  void handleTap() {
    switch (_state) {
      case CellState.x:
        _state = CellState.o;
        break;
      case CellState.o:
        _state = CellState.empty;
        break;
      case CellState.empty:
        _state = CellState.x;
        break;
      case CellState.outside:
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
        ),
        width: _size,
        height: _size,
        child: Icon(_state.icon),
      ),
    );
  }
}
