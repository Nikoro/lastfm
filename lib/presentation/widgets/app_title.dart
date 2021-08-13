import 'package:flutter/material.dart';
import 'package:lastfm/resources/color_palette.dart';
import 'package:lastfm/resources/font_sizes.dart';
import 'package:lastfm/resources/strings.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key, this.fontSize}) : super(key: key);

  const AppTitle.big({Key? key}) : this(key: key, fontSize: FontSizes.big);

  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.appName,
      style: TextStyle(color: ColorPalette.guardsmanRed, fontSize: fontSize),
    );
  }
}
