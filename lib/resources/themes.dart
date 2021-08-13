import 'package:flutter/material.dart';
import 'package:lastfm/resources/color_palette.dart';

abstract class Themes {
  Themes._();

  static ThemeData main = ThemeData(
    accentColor: ColorPalette.guardsmanRed,
  );
}
