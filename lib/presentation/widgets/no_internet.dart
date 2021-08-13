import 'package:flutter/material.dart';
import 'package:lastfm/presentation/widgets/retry.dart';
import 'package:lastfm/resources/strings.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key, this.onRetryPressed}) : super(key: key);

  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Retry(
      text: Strings.noInternetConnection,
      child: const Icon(
        Icons.cloud_off,
        size: 60,
      ),
      onRetryPressed: onRetryPressed,
    );
  }
}
