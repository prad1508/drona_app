
import '../data/network/base_apiservices.dart';
import '../model/academy_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class AcademyRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<AcademyListModel> fetchAcademyListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.academyRegistrationTrackEndPint);
      return response = AcademyListModel.fromJson(response);
      
    }catch(e){
      rethrow ;
    }
  }

  Future<AcademyListModel> fetchEditAcademyListApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.academyRegistrationTrackEndPint , data);
      return response = AcademyListModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }



}
