import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/colors.dart';

import '../model/rules.dart';

/// This widget is a text container.
///
/// It shows game rules.
class GameRulesView extends StatelessWidget {
  const GameRulesView({super.key});

  final double lineSpacing = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ExpansionTile(
        collapsedBackgroundColor: AppColors.rules.title,
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Text(
          'Game rules',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1))),
                  child: Text(
                    'General rules',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
              SizedBox(height: lineSpacing),
              Text(GameRules.generalRules()),
              SizedBox(height: lineSpacing),
              Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1))),
                  child: Text('Variants with different rules',
                      style: Theme.of(context).textTheme.titleMedium)),
              SizedBox(height: lineSpacing),
              const Text('Four-in-a-row',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: lineSpacing),
              Text(GameRules.fourInARowRules()),
              SizedBox(height: lineSpacing),
              const Text('Misere tic-tac-toe',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: lineSpacing),
              Text(GameRules.misereRules()),
            ],
          ),
        ],
      ),
    );
  }
}
