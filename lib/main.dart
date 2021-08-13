import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastfm/di/injection.dart';
import 'package:lastfm/presentation/core/app.dart';

void main() {
  configureDependencies();
  _setTransparentStatusBar();
  runApp(const App());
}

void _setTransparentStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
