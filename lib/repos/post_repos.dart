
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'main_repo.dart';


// POST METHOD(simple)
/*Note-- The return type depends on what response.data is expected to be.
 If it's complex, you might need to return dynamic.*/

Future<Response?> postData(String endpoint,Map<String, dynamic> data) async {

  // Generic method for POST requests
    try {
      final response = await MainRepo.dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      MainRepo.handleError(e);
      return null;
    }
}


Future<Response?> postUploadImage(String endpoint, File imageFile, {Map<String, dynamic>? extraData}) async {
  try {
    // Prepare FormData
    String fileName = basename(imageFile.path); // Extracts the filename
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path, filename: fileName),
      if (extraData != null) ...extraData, // Include any additional data in the form
    });

    // Send POST request
    final response = await MainRepo.dio.post(endpoint, data: formData);
    return response;
  } catch (e) {
    MainRepo.handleError(e);
    return null;
  }
}

