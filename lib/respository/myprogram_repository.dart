
import '../data/network/base_apiservices.dart';
import '../model/myprogram_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class MyProgramRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<MyProgramListModel> fetchMyProgramListApi(data)async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.myProgramListEndPoint + data);
      return response = MyProgramListModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

  Future<MyProgramListModel> fetchAddSingleMyProgramListApi(data)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.programListEndPoint1,data);
      return response = MyProgramListModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

}
