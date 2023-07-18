
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '../model/facility_model.dart';
import '../model/myFacility_model.dart';
import '/res/app_url.dart';

class FacilityRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<FacilityListModel> fetchFacilityListApi(data)async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.facilityListEndPoint + data);
      return response = FacilityListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

 Future<MyFacilityListModel> fetchGetFacilityListApi(String serviceId)async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.facilityGetEndPoint + serviceId);
      return response = MyFacilityListModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }

}
