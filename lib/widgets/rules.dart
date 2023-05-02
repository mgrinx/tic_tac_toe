import 'package:flutter/material.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'For each board you can choose one of the rules variation to play:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1))),
              child: Text(
                'Traditional rules',
                style: Theme.of(context).textTheme.titleMedium,
              )),
          SizedBox(height: lineSpacing),
          Text(gameRules[traditionalKey]!),
          SizedBox(height: lineSpacing),
          Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1))),
              child: Text('Variants with different rules',
                  style: Theme.of(context).textTheme.titleMedium)),
          Column(
            children: gameRules.keys.where((k) => k != traditionalKey).map((k) => 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: lineSpacing),
                  Text(k, style: const TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: lineSpacing),
                  Text( gameRules[k]!),
                ],
              )).toList()
          ),
        ],
      ),
    );
  }
}
