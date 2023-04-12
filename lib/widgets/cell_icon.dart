import 'package:flutter/material.dart';

import '../model/game.dart';
import '../styles/colors.dart';

class CellIconView extends StatelessWidget {
  const CellIconView({super.key, required this.state});

  static const _size = 30.0;
  final CellState state;

  Color _getBorderColor() {
    switch (state) {
      case CellState.outside:
        return AppColors.general.transparent;
      default:
        return AppColors.card.grid;
    }
  }

  Color _getBackgroundColor() {
    switch (state) {
      case CellState.outside:
        return AppColors.general.transparent;
      default:
        return AppColors.card.cell;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(), width: 0),
          color: _getBackgroundColor(),
        ),
        width: _size,
        height: _size,
        child: const Text(''),
      ),
    );
  }
}
