<!DOCTYPE html>
<html lang="en">


  <div class="container">
    <h1>GET Api</h1>
    <h3>NOTE: The return type in this method depends on your API response</h3>
    <!-- get api -->
    Future<Response?> getData(String endpoint) async {
    try {
      final response = await MainRepo.dio.get(endpoint);
      return response;
    } catch (e) {
      MainRepo.handleError(e);
      return null;
    }}
</div>

  <div class="container">
    <h1>POST Api</h1>
    <h3>NOTE: The return type in this method depends on your API response</h3>  
    <!--post api -->
    Future<Response?> postData(String endpoint,Map<String, dynamic> data) async {
    try {
      final response = await MainRepo.dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      MainRepo.handleError(e);
      return null;
    }}
</div>

  <div class="container">
    <h1>DELETE Api</h1>
    <h3>NOTE: The return type in this method depends on your API response</h3>  
    <!-- delete api-->
    Future<Response?> deleteData(String endpoint,Map<String, dynamic> data) async {
    try {
      final response = await MainRepo.dio.delete(endpoint, data: data);
      return response;
    } catch (e) {
      MainRepo.handleError(e);
      return null;
    }}
</div>

  <div class="container">
    <h1>PUT Api</h1>
    <h3>NOTE: The return type in this method depends on your API response</h3>  
    <!-- put api-->
    Future<Response?> putData(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await MainRepo.dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      MainRepo.handleError(e);
      return null;
    }}
</div>





</html>
