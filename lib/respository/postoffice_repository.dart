
import '../model/postoffice.dart';
import '/data/network/BaseApiServices.dart';
import '/data/network/NetworkApiService.dart';
import '/res/app_url.dart';

class PostofficeRepository {
  BaseApiServices _apiServices = NetworkApiService() ;

  Future<PostofficeListModel> fetchPostofficeListApi(data)async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.postofficeListEndPoint + data);
      return response = PostofficeListModel.fromJson(response[0]);
      
    }catch(e){
      throw e ;
    }
  }

}
