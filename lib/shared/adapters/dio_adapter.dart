import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../http/errors/http_error.dart';
import '../http/interceptors/dio_interceptor.dart';
import '../http/proxy/http_proxy.dart';
import '../http/response/http_response.dart';
import 'http_client_adapter.dart';

class DioAdapter extends IHttpClientAdapter {
  late final Dio dio;
  final Map<String, dynamic> headers;

  DioAdapter({this.headers = const {}}) {
    dio = Dio();
    dio.interceptors.addAll([DioInterceptor()]);
    dio.options = BaseOptions(baseUrl: '', headers: headers);
    if (!kIsWeb) {
      HttpProxy(dio);
    }
  }

  static const _authorization = 'Authorization';

  @override
  Future<Either<HttpError, HttpResponse>> delete(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async =>
      await _call(
        () => dio.delete(
          url,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );

  @override
  Future<Either<HttpError, HttpResponse>> get(
    String url, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async =>
      await _call(
        () => dio.get(
          url,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );

  @override
  Future<Either<HttpError, HttpResponse>> post(
    String url, {
    data,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async =>
      await _call(
        () => dio.post(
          url,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );

  @override
  Future<Either<HttpError, HttpResponse>> put(
    String url, {
    data,
    Map<String, String>? queryParams,
    Map<String, String>? headers,
  }) async =>
      await _call(
        () => dio.put(
          url,
          data: data,
          queryParameters: queryParams,
          options: Options(headers: headers),
        ),
      );

  @protected
  Future<Either<HttpError, HttpResponse>> _call(
      Future<Response> Function() callback) async {
    try {
      final response = await callback();

      return Right(
        HttpResponse(
          data: response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioError catch (e) {
      return Left(
        HttpError(
          requestOptions: e.requestOptions,
          data: e.response?.data,
          message: e.message,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  void removeAuthorization() {
    dio.options.headers.remove(_authorization);
  }

  @override
  void setAuthorization(String token) {
    dio.options.headers.putIfAbsent(_authorization, () => token);
  }

  @override
  void addHeader(String key, String value) {
    dio.options.headers.putIfAbsent(key, () => value);
  }
}
