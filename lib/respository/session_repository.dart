
import 'package:drona/model/session_details_model.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '../model/sessionList_model.dart';
import '/res/app_url.dart';

class SessionRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  //userprofile add
  Future<dynamic>  fetchCreateSessionListApi(data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.createsessionListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<SessionListListModel> fetchSessionListSearchApi(dynamic data, var pageSize, var pageNo) async {
    try {
      dynamic response = await _apiServices.getPutApiResponseWithData(
          "${AppUrl.sessionListEndPoint}/$pageSize/$pageNo", data);
      print("response==$response");
      return response = SessionListListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SessionListListModel> fetchSessionDetailsListApi(String? id ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          '${AppUrl.sessionDetailsListEndPoint}/$id');

      return response = SessionListListModel.fromJson(response);


    } catch (e) {
      print("error is$e");
      print(e);
      rethrow;
    }
  }

  Future<SessionDetailsModel> fetchSessionDetailsListApi2(String? id ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          '${AppUrl.sessionDetailsListEndPoint}/$id');
      print("object==$response");
      return response = SessionDetailsModel.fromJson(response);
      print("object==$response");

    } catch (e) {
      print("error is$e");
      print(e);
      rethrow;
    }
  }

}




