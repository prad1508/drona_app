
import 'dart:developer';

import 'package:drona/model/attendance_model.dart';
import 'package:drona/model/closeSession_model.dart';
import 'package:drona/model/session_details_model.dart';
import 'package:drona/model/update_session_model.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '../model/cancelSesssion_model.dart';
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
      log("response==$response");
      return response = SessionListListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

/*
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
*/

  Future<SessionDetailsModel> fetchSessionDetailsListApi2(String? id ) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          '${AppUrl.sessionDetailsListEndPoint}/$id');
      log("object==$response");
      return response = SessionDetailsModel.fromJson(response);
      print("object==$response");

    } catch (e) {
      print("error is$e");
      print(e);
      rethrow;
    }
  }

  Future<MarkAttendanceModel> postMarkedAttendanceApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.markAttendance, data);
      log("object==$response");
      return response = MarkAttendanceModel.fromJson(response);
      print("object==$response");

    } catch (e) {
      log("error is$e");
      log(e.toString());
      rethrow;
    }
  }
  Future<CancelSessionModel> putSessionCancelApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPutApiResponseWithData(
          AppUrl.sessionCancel, data);
      log("object==$response");
      return response = CancelSessionModel.fromJson(response);
      print("object==$response");

    } catch (e) {
      log("error is$e");
      rethrow;
    }
  }
  Future<UpdateSessionModel> putSessionUpdateApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPutApiResponseWithData(
          AppUrl.sessionUpdate, data);
      log("object==$response");
      return response = UpdateSessionModel.fromJson(response);
      print("object==$response");

    } catch (e) {
      log("error is$e");
      rethrow;
    }
  }
  Future<CloseSessionModel> postSessionCloseApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.sessionClose, data);
      log("object==$response");
      return response = CloseSessionModel.fromJson(response);

    } catch (e) {
      log("error is$e");
      rethrow;
    }
  }

}




