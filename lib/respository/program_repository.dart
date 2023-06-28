
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '../model/program_model.dart';
import '/res/app_url.dart';

class ProgramRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<ProgramListModel> fetchProgramListApi(data)async{
    try{
      print("data is $data");
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.programListEndPoint + data);
      return response = ProgramListModel.fromJson(response);
      
    }catch(e){
      print(e);
      rethrow ;
    }
  }

}
