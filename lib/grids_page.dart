import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/colors.dart';
import 'package:tic_tac_toe/widgets/board_icon.dart';

import 'model/boards.dart';

class GridsPage extends StatelessWidget {
  GridsPage({super.key, required this.grid});

  final ValueNotifier<String> grid;

  final List boardsList = boardTemplates.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose grid'),
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
                    children: boardTemplates.keys
                        .map((k) => SelectGrid(
                              grid: k,
                              currentGrid: grid,
                            ))
                        .toList(),
                  ),
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
  const SelectGrid({super.key, required this.grid, required this.currentGrid});
  final String grid;
  final ValueNotifier<String> currentGrid;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(color: AppColors.card.text);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          currentGrid.value = grid;
          Navigator.pop(context);
        },
        child: Card(
            color: AppColors.card.background,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoardIconView(board: boardTemplates[grid]!),
                  const SizedBox(height: 20),
                  Text(
                    grid,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
