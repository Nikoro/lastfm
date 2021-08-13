import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lastfm/resources/constants.dart';

@module
abstract class DioModule {
  Dio get dio {
    final _dio = Dio();
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000; //3s
    _dio.interceptors.addAll([
      LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true),
      _ApiKeyInterceptor()
    ]);
    return _dio;
  }
}

class _ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.path += '&api_key=${Constants.lastFmAPIKey}&format=json';
    return super.onRequest(options, handler);
  }
}
