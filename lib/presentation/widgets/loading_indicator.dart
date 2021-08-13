import 'package:flutter/material.dart';
import 'package:lastfm/extensions.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = context.theme.accentColor;
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(accentColor),
      ),
    );
  }
}
