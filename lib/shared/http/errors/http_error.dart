// ignore_for_file: overridden_fields

import 'package:dio/dio.dart';

class HttpError extends DioError implements Exception {
  final dynamic data;
  final int? statusCode;
  @override
  final String? message;
  @override
  final RequestOptions requestOptions;

  HttpError({
    this.data,
    this.statusCode = 500,
    this.message,
    required this.requestOptions,
  }) : super(requestOptions: requestOptions);

  @override
  String toString() =>
      'HttpError(data: $data, statusCode: $statusCode, message: $message)';
}
