
import '../data/network/base_apiservices.dart';
import '../model/coachlist_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class CoachlistRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<CoachlistListModel> fetchCoachlistListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.coachlistListEndPoint);
      return response = CoachlistListModel.fromJson(response);
      
    }catch(e){
      rethrow ;
    }
  }

}
