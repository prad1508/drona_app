
import '../data/network/base_apiservices.dart';
import '../model/myprofi_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class MyprofiRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<MyprofiListModel> fetchMyprofiListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.myprofiListEndPoint);
      print("profile details api success");
      return response = MyprofiListModel.fromJson(response);
      
    }catch(e){
      print("profile api not success");
      print(e.toString());
      rethrow ;
    }
  }

}
