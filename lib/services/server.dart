import 'package:dio/dio.dart';

const baseServerUrl = 'https://krayik.herokuapp.com/krayikapi/v1/';
Dio dio = Dio(
  BaseOptions(
    baseUrl: baseServerUrl,
    connectTimeout: 5000, // 5s
    receiveTimeout: 100000, // 100s
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ),
);
