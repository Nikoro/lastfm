import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lastfm/domain/album/album.dart';
import 'package:lastfm/presentation/details/details_page.dart';

extension BuildContextExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  ThemeData get theme => Theme.of(this);
}

extension NavigatorStatextensions on NavigatorState {
  void navigate(Widget page) {
    context.navigator.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushDetailsPage(Album album) {
    context.navigator.navigate(DetailsPage(album: album));
  }
}

extension DioExtensions on DioError {
  bool get isNoConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }
}
