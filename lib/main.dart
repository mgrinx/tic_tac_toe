import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/game.dart';

import 'grids_page.dart';
import 'model/boards.dart';
import 'widgets/board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _initialGrid = 'Classic';

  Game _game = _createGame(_initialGrid);
  final ValueNotifier<String> _grid = ValueNotifier<String>(_initialGrid);

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
    print('new game');
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
                        backgroundColor: Colors.amber[600]),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
