abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> deleteApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPutApiResponse(String url);
  Future<dynamic> getPutApiResponseWithData(String url, dynamic data);

  Future<dynamic> getPostWithoutApiResponse(String url, dynamic data);
  Future<dynamic> uploadImageHTTP(String url, dynamic data);
  Future<dynamic> uploadImageHTTP2(String url, dynamic data);
}
