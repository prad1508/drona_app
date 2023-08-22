
import 'package:drona/model/dashboard.dart';
import 'package:drona/model/dashboard_model.dart';

import '../data/network/base_apiservices.dart';
import '../model/academy_model.dart';
import '../data/network/network_apiservice.dart';
import '../model/dashboard_session_model.dart';
import '/res/app_url.dart';

class DashBoardRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<DashBoardModel> fetchHomeListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.dashBoardHome);
      return response = DashBoardModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

  Future<DashBoardSessionModel> fetchSessionBatchListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.dashBoardSessionHome);
      return response = DashBoardSessionModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }



}
