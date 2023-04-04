import 'package:flutter/material.dart';

import 'model/game.dart';

class Cell extends StatefulWidget {
  const Cell(int i, {super.key, this.state = CellState.x});

  final CellState state;

  @override
  State<Cell> createState() => _CellState(state);
}

class _CellState extends State<Cell> {
  _CellState(this._state);

  CellState _state;
  static const _size = 40.0;

  void handleTap() {
    switch (_state) {
      case CellState.x:
      case CellState.o:
      case CellState.outside:
        break;
      case CellState.empty:
        _state = CellState.x;
        break;
    }
    setState(() {});
  }

  Widget _getIcon() {
    switch (_state) {
      case CellState.x:
      case CellState.o:
        return Icon(_state.icon);
      case CellState.empty:
      case CellState.outside:
        return const Text('');
    }
  }

  Color _getBorderColor() {
    switch (_state) {
      case CellState.x:
      case CellState.o:
      case CellState.empty:
        return Colors.black;
      case CellState.outside:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:_getBorderColor(), width: 0),
        ),
        width: _size,
        height: _size,
        child: _getIcon(),
      ),
    );
  }
}
