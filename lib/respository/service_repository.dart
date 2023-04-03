
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/model/service_model.dart';
import '/res/app_url.dart';

class ServiceRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<ServiceListModel> fetchServiceListApi(data)async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.serviceListEndPoint + data);
      return response = ServiceListModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

}
