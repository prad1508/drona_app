
import '../data/network/base_apiservices.dart';
import '../model/myservices_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class MyservicesRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<MyservicesListModel> fetchMyservicesListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.myservicesListEndPoint);
      return response = MyservicesListModel.fromJson(response);
      
    }catch(e){
      rethrow ;
    }
  }

}
