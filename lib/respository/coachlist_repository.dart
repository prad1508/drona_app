
import 'dart:developer';

import '../data/network/base_apiservices.dart';
import '../model/active_deactive_model.dart';
import '../model/coach_list_model.dart';
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

  Future<CoachlistModel> fetchCoachlistApi(Map<String, dynamic> data)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.coachlistfilteroint,data);
      log("response is $response");
      return response = CoachlistModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

  Future<ActiveDeactiveModel> activateCoachListApi(Map<String, dynamic> data)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.coachActivate,data);
      log("response is $response");
      return response = ActiveDeactiveModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }
  Future<ActiveDeactiveModel> deActivateCoachListApi(Map<String, dynamic> data)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.coachDeactivate,data);
      log("response is $response");
      return response = ActiveDeactiveModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

  Future<dynamic> addMultiCoachApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.multiCoachEndPoint, data);
      print("response==response");
      return response;
    } catch (e) {
      print("$e");
      print("addMultiCoachApi post api not success");
      rethrow;
    }
  }


}
