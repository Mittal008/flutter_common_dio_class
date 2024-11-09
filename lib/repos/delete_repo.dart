
import 'package:dio/dio.dart';
import 'main_repo.dart';

// DELETE METHOD
/*Note-- The return type depends on what response.data is expected to be.
 If it's complex, you might need to return dynamic.*/
Future<Response?> deleteData(String endpoint,Map<String, dynamic> data) async {
  try {
    final response = await MainRepo.dio.delete(endpoint, data: data);
    return response;
  } catch (e) {
    MainRepo.handleError(e);
    return null;
  }
}
