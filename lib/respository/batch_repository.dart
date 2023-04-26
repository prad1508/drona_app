
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class BatchRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;
  
   //userprofile add
   Future<dynamic>  fetchCreatebatchListApi(data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.createbatchListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
   }

}
