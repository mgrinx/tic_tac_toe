import 'package:flutter/material.dart';

class AppColors {
  static _Scaffold scaffold = _Scaffold();
  static _Button button = _Button();
  static _Card card = _Card();
  static _Board board = _Board();
  static _General general = _General();
}

class _Scaffold {
  MaterialColor primary = Colors.pink;
}

class _Button {
  Color? reset = Colors.amber[600];
}

class _Card {
  Color? background = Colors.amber[300];
}

class _Board {
  Color grid = Colors.black;
}

class _General {
  Color transparent = Colors.transparent;
}
