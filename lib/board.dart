import 'package:flutter/widgets.dart';

import 'cell.dart';
import 'model/game.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key, required this.board});
  final Board board;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for(final row in board)
            Row(
              children: [
                for(final column in row)
                  Cell(0, state: column),
              ],
            ),
        ],
      )],
    );
  }
}
