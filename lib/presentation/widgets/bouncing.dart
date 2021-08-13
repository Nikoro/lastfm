import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lastfm/resources/color_palette.dart';

class BouncingArrow extends HookWidget {
  const BouncingArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 20,
    )..repeat(reverse: true);
    return AnimatedBuilder(
      animation: controller,
      child: const Icon(
        Icons.arrow_upward,
        color: ColorPalette.guardsmanRed,
        size: 45,
      ),
      builder: (_, child) {
        return Container(
          margin: EdgeInsets.only(top: controller.value),
          child: child,
        );
      },
    );
  }
}
