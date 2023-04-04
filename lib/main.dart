import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board.dart';
import 'package:tic_tac_toe/model/game.dart';

import 'model/boards.dart';

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

class GridsPage extends StatefulWidget {
  const GridsPage({super.key});

  static const String title = 'Choose grid';

  @override
  State<GridsPage> createState() => _GridsPageState();
}

class _GridsPageState extends State<GridsPage> {
  List boardsList = boards.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(GridsPage.title),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(children: <Widget>[
                  GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: true,
                      crossAxisCount: constraints.maxWidth > 700 ? 4 : 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: List.generate(boardsList.length,
                          (index) => SelectGrid(grid: index))),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ]),
              ),
            ),
          );
        }));
  }
}

class SelectGrid extends StatelessWidget {
  const SelectGrid({super.key, required this.grid});
  final int grid;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(grid: grid)),
          );
        },
        child: Card(
            color: Colors.amber[300],
            child: Center(
                child: Text(
              boards.keys.elementAt(grid),
              style: textStyle,
              textAlign: TextAlign.center,
            ))),
      ),
    );
  }
}
