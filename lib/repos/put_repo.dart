import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'main_repo.dart';

// PUT METHOD
/*Note-- The return type depends on what response.data is expected to be.
 If it's complex, you might need to return dynamic.*/


Future<Response?> putData(String endpoint, Map<String, dynamic> data) async {
  try {
    final response = await MainRepo.dio.put(endpoint, data: data);
    return response;
  } catch (e) {
    MainRepo.handleError(e);
    return null;
  }
}

// PUT METHOD(Multipart)
Future<Object?> putDataWithImage(String endpoint, Map<String, dynamic> mapData, String filePath) async {
  try {
    // Create the multipart file
    File file = File(filePath);
    String fileName = basename(file.path); // Get the file name

    FormData formData = FormData.fromMap({
      'description': mapData, // Additional data
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    });

    // Make the request
    Response response = await MainRepo.dio.put(
      endpoint, // The API endpoint
      data: formData,
      options: Options(headers: {
        'Content-Type': 'multipart/form-data',
      }),
    );

    debugPrint('Data: ${response.data}');
    return response.data;
  } on DioException catch (e) {
    // Handle timeout
    if (e.type == DioExceptionType.connectionTimeout) {
      debugPrint('Connection Timeout!');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      debugPrint('Receive Timeout!');
    }
    // Handle response errors (e.g., 4xx, 5xx status codes)
    else if (e.type == DioExceptionType.badResponse) {
      debugPrint('Bad Response: ${e.response?.statusCode}');
    }
    // Handle network issues (e.g., no internet)
    else if (e.type == DioExceptionType.unknown) {
      debugPrint('Network Issue: ${e.message}');
    }
    // Handle all other DioError types
    else {
      debugPrint('Error occurred: ${e.message}');
    }
    return null;
  } catch (e) {
    // Handle any other errors
    debugPrint('Unexpected error: $e');
    return null;
  }
}
