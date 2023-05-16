import 'package:flutter/material.dart';

import '../grids_page.dart';
import '../model/boards.dart';
import '../model/game.dart';
import '../styles/colors.dart';
import 'board.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late Game _game;
  final ValueNotifier<String> _grid = ValueNotifier<String>(initialGridName);

  @override
  void initState() {
    _game = _createGame(initialGridName);

    _grid.addListener(() {
      setState(() {
        _game = _createGame(_grid.value);
      });
    });

    super.initState();
  }

  Game _createGame(String boardName) {
    Game newGame = Game(createBoard(boardName));

    newGame.lastMove.addListener(() {
      setState(() {});
    });

    return newGame;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _grid.value,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        BoardView(game: _game),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _game.lastMove.value == null
                    ? null
                    : () {
                        _game.stepBack();
                        setState(() {
                          _game.lastMove.value = null;
                        });
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button.stepBack),
                child: const Text('Step back')),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _game = _createGame(_grid.value);
                  _game.lastMove.value = null;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button.reset),
              child: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridsPage(grid: _grid)),
            );
          },
          child: const Text('Choose grid'),
        ),
      ],
    );
  }
}
