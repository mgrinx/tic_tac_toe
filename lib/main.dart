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
  static const int defaultGridIdx = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(grid: defaultGridIdx),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.grid});

  static const String title = 'Flutter Demo Home Page';
  final int grid;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Game _game = Game(boards.entries.toList()[0].value);

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
                    boards.keys.elementAt(widget.grid),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  BoardView(game: _game),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // TODO: fix circular reference
                            builder: (context) => const GridsPage()),
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
