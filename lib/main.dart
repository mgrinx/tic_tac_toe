import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/game.dart';
import 'package:tic_tac_toe/styles/colors.dart';
import 'package:tic_tac_toe/widgets/rules.dart';

import 'grids_page.dart';
import 'model/boards.dart';
import 'widgets/board.dart';

void main() {
  runApp(const MyApp());
}

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Chat Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: AppColors.scaffold.primary,
      ),
      home: const MyHomePage(),
    );
  }
}

/// This widget is the home page of your application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String title = 'Flutter-Chat Tic-Tac-Toe';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// A subclass of MyHomePage.
///
/// Builds the home page based on [_game] and [_grid] values.
class _MyHomePageState extends State<MyHomePage> {
  Game _game = _createGame(initialGridName);
  final ValueNotifier<String> _grid = ValueNotifier<String>(initialGridName);

  @override
  void initState() {
    _grid.addListener(() {
      setState(() {
        _game = _createGame(_grid.value);
      });
    });
    super.initState();
  }

  static Game _createGame(String boardName) {
    return Game(createBoard(boardName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyHomePage.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Center(
              child: Column(
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _game = _createGame(_grid.value);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button.reset),
                    child: const Text('Reset'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GridsPage(grid: _grid)),
                      );
                    },
                    child: const Text('Choose grid'),
                  ),
                  const SizedBox(height: 40),
                  const GameRulesView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
