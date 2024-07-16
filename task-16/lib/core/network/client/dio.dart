import 'package:dio/dio.dart';

abstract class DioSettings {
  static const baseUrl = 'https://eightballapi.com/api';
  static const connectionTimeout = Duration(seconds: 3);
  static const receiveTimeout = Duration(seconds: 5);
}

class DioClient {
  static Dio init() {
    return Dio()
      ..options.baseUrl = DioSettings.baseUrl
      ..options.connectTimeout = DioSettings.connectionTimeout
      ..options.receiveTimeout = DioSettings.receiveTimeout;
  }
}
