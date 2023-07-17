
import '../data/network/base_apiservices.dart';
import '../model/batchList_model.dart';
import '../data/network/network_apiservice.dart';
import '../model/batch_Filter_model.dart';
import '/res/app_url.dart';

class BatchListRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<BatchListListModel> fetchBatchListListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.batchListListEndPoint);
      return response = BatchListListModel.fromJson(response);
      
    }catch(e){
      rethrow ;
    }
  }

  Future<BatchFilterModel> fetchBatchSearch(dynamic data, var pageSize, var pageNo)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(
          "${AppUrl.batchsearch}/$pageSize/$pageNo",data);
      return response = BatchFilterModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

}
