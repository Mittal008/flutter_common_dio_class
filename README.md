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

<br>
<br>
<br>

<div class="container">
  <p><b>You will find the rest of the code in the lib file, so check it out.</b> <br> I hope there is no error in your code.😊 
    <br> If there is any issue in my libraries then I have links to the libraries I have linked to.👇 </p>

  <br>
  <br>
  <br>

  <ul>
  <li><a href="https://pub.dev/packages/dio/install">Dio</a></li>
  <li><a href="https://pub.dev/packages/path/install">Path</a></li>
</ul>  
  
</div>



</html>
