import 'package:flutter/material.dart';

import 'main.dart';
import 'model/boards.dart';

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
