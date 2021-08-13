import 'package:flutter/material.dart';
import 'package:lastfm/presentation/widgets/retry.dart';
import 'package:lastfm/resources/font_sizes.dart';
import 'package:lastfm/resources/strings.dart';

class Failure extends StatelessWidget {
  const Failure({Key? key, this.text, this.onRetryPressed}) : super(key: key);

  final String? text;
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Retry(
      text: text ?? Strings.somethingWentWrong,
      child: const Text(
        '😭',
        style: TextStyle(fontSize: FontSizes.huge),
      ),
      onRetryPressed: onRetryPressed,
    );
  }
}
