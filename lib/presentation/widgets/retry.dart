import 'package:flutter/material.dart';
import 'package:lastfm/resources/color_palette.dart';
import 'package:lastfm/resources/dimensions.dart';
import 'package:lastfm/resources/font_sizes.dart';
import 'package:lastfm/resources/strings.dart';

class Retry extends StatelessWidget {
  const Retry({Key? key, required this.text, this.child, this.onRetryPressed})
      : super(key: key);

  final String text;
  final VoidCallback? onRetryPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: FontSizes.big),
          ),
          const SizedBox(height: Dimensions.medium),
          if (child != null) ...[
            child!,
            const SizedBox(height: Dimensions.medium),
          ],
          if (onRetryPressed != null)
            ElevatedButton(
              child: const Text(Strings.retry),
              style: ElevatedButton.styleFrom(primary: ColorPalette.black),
              onPressed: onRetryPressed,
            )
        ],
      ),
    );
  }
}
