import 'package:flutter/material.dart';

/// An app colors grouped by widgets
class AppColors {
  static ScaffoldColor scaffold = ScaffoldColor();
  static ButtonColor button = ButtonColor();
  static CardColor card = CardColor();
  static BoardColor board = BoardColor();
  static GeneralColor general = GeneralColor();
  static GameRulesColor rules = GameRulesColor();
}

/// A scaffold group of colors
class ScaffoldColor {
  MaterialColor primary = Colors.pink;
}

/// A button group of colors
class ButtonColor {
  Color? reset = Colors.amber[600];
}

/// A card group of colors
class CardColor {
  Color? background = Colors.amber[600];
  Color grid = Colors.black87;
  Color cell = Colors.white;
  Color text = Colors.white;
}

/// A board group of colors
class BoardColor {
  Color grid = Colors.black;
}

/// A general group of colors
class GeneralColor {
  Color transparent = Colors.transparent;
}

// A game rules group of colors
class GameRulesColor {
  Color title = const Color.fromARGB(255, 223, 225, 225);
}
