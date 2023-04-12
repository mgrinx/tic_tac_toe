import 'package:flutter/material.dart';

import '../model/game.dart';
import '../styles/colors.dart';

class CellView extends StatefulWidget {
  const CellView({
    super.key,
    required this.game,
    required this.x,
    required this.y,
  });

  final Game game;
  final int x;
  final int y;

  @override
  State<CellView> createState() => _CellViewState();
}

class _CellViewState extends State<CellView> {
  _CellViewState();

  static const _size = 40.0;

  void handleTap() {
    widget.game.updateCellOnTap(widget.x, widget.y);
    setState(() {});
  }

  CellState get _state => widget.game.cellState(widget.x, widget.y);

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
        return AppColors.board.grid;
      case CellState.outside:
        return AppColors.general.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _state == CellState.empty ? handleTap : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(), width: 0),
        ),
        width: _size,
        height: _size,
        child: _getIcon(),
      ),
    );
  }
}
