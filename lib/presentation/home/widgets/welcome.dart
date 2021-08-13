import 'package:flutter/material.dart';
import 'package:lastfm/presentation/widgets/bouncing.dart';
import 'package:lastfm/resources/color_palette.dart';
import 'package:lastfm/resources/font_sizes.dart';
import 'package:lastfm/resources/strings.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: FontSizes.big);
    return Stack(
      alignment: Alignment.topRight,
      children: [
        const BouncingArrow(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                Strings.use,
                style: textStyle,
              ),
              Icon(
                Icons.search,
                color: ColorPalette.guardsmanRed,
                size: 30,
              ),
              Text(
                Strings.toSearch,
                style: textStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
