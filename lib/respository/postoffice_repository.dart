
import '../data/network/base_apiservices.dart';
import '../model/postoffice.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class PostofficeRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<PostofficeListModel> fetchPostofficeListApi(data)async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.postofficeListEndPoint + data);
      return response = PostofficeListModel.fromJson(response[0]);
      
    }catch(e){
      rethrow ;
    }
  }

}
