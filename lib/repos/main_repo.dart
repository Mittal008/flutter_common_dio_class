import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common_dio_class/repos/delete_repo.dart';
import 'package:flutter_common_dio_class/repos/get_repo.dart';
import 'package:flutter_common_dio_class/repos/post_repos.dart';
import 'package:flutter_common_dio_class/repos/put_repo.dart';

class MainRepo {
  static final Dio dio = Dio(BaseOptions(
    // Replace with your base URL
  baseUrl: 'https://jsonplaceholder.typicode.com/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  MainRepo() {
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
    ));
  }

  static handleError(Object error) {
    String errorDescription = '';
    if (error is DioError) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Connection timeout with the server';
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = 'Send timeout in connection with the server';
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Receive timeout in connection with the server';
          break;
        case DioExceptionType.badResponse:
          errorDescription =
              'Received an invalid status code: ${error.response?.statusCode}';
          break;
        case DioExceptionType.cancel:
          errorDescription = 'Request to the server was cancelled';
          break;
        case DioExceptionType.unknown:
        default:
          errorDescription = 'Unexpected error occurred: ${error.message}';
          break;
      }
      debugPrint('Dio error: $errorDescription');
    } else {
      debugPrint('Unexpected error: $error');
    }
  }

  static Future<Response?> postApi(String endpoint, {required data}) =>
      postData(endpoint, data);

  static Future<Response?> getApi(String endpoint) => getData(endpoint);

  static Future<Response?> deleteApi(String endpoint, {required data}) =>
      deleteData(endpoint, data);

  static Future<Response?> putApi(String endpoint, {required data}) =>
      putData(endpoint, data);
}
