import 'package:flutter/material.dart';
import 'package:lastfm/presentation/home/home_page.dart';
import 'package:lastfm/resources/strings.dart';
import 'package:lastfm/resources/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: Themes.main,
      home: const HomePage(),
    );
  }
}
