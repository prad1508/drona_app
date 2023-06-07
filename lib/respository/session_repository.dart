
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class SessionRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  //userprofile add
  Future<dynamic>  fetchCreateSessionListApi(data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.createsessionListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
