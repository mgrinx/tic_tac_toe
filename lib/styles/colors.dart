import 'package:flutter/material.dart';

/// An app colors grouped by widgets
class AppColors {
  static _Scaffold scaffold = _Scaffold();
  static _Button button = _Button();
  static _Card card = _Card();
  static _Board board = _Board();
  static _General general = _General();
}

/// A scaffold group of colors
class _Scaffold {
  MaterialColor primary = Colors.pink;
}

/// A button group of colors
class _Button {
  Color? reset = Colors.amber[600];
}

/// A card group of colors
class _Card {
  Color? background = Colors.amber[600];
  Color grid = Colors.black87;
  Color cell = Colors.white;
  Color text = Colors.white;
}

/// A board group of colors
class _Board {
  Color grid = Colors.black;
}

/// A general group of colors
class _General {
  Color transparent = Colors.transparent;
}
