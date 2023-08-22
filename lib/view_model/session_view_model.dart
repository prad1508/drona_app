import 'package:drona/model/attendance_model.dart';
import 'package:drona/model/cancelSesssion_model.dart';
import 'package:drona/model/closeSession_model.dart';
import 'package:drona/model/session_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/response/api_response.dart';
import '../model/sessionList_model.dart';
import '../model/update_session_model.dart';
import '../respository/session_repository.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';
import '../view/session_listing/session_list.dart';
import '../view/session_listing/view_detailsclosed.dart';

class SessionViewViewModel with ChangeNotifier {
  final _myRepo = SessionRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchCreateSessionListApi(
      dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.fetchCreateSessionListApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      print("scuessfullydvbghn");

      /// navigate for next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const SessionList(),
        ),
      );
    }).onError((error, stackTrace) {
      print("error msg is");
      print(error.toString());
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  ApiResponse<SessionListListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<SessionListListModel> response) {
    dataList = response;
    notifyListeners();
  }

  ApiResponse<SessionDetailsModel> dataList2 = ApiResponse.loading();
  setDataList2(ApiResponse<SessionDetailsModel> response) {
    dataList2 = response;
    notifyListeners();
  }

  ApiResponse<MarkAttendanceModel> dataList3 = ApiResponse.loading();
  setDataList3(ApiResponse<MarkAttendanceModel> response) {
    dataList3 = response;
    notifyListeners();
  }

  ApiResponse<CancelSessionModel> dataList4 = ApiResponse.loading();
  setDataList4(ApiResponse<CancelSessionModel> response) {
    dataList4 = response;
    notifyListeners();
  }
  ApiResponse<UpdateSessionModel> dataList6 = ApiResponse.loading();
  setDataList6(ApiResponse<UpdateSessionModel> response) {
    dataList6 = response;
    notifyListeners();
  }

  ApiResponse<CloseSessionModel> dataList5 = ApiResponse.loading();
  setDataList5(ApiResponse<CloseSessionModel> response) {
    dataList5 = response;
    notifyListeners();
  }

  Future<void> fetchSessionListSearchApi(
      dynamic data, var pageSize, var pageNo) async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchSessionListSearchApi(data, pageSize, pageNo).then((value) {
      setDataList(ApiResponse.completed(value));

      print("api session serach list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("api  session search list not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }

/*
  Future<void> fetchSessionDetailsListhApi(String? id) async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchSessionDetailsListApi(id).then((value) {
      setDataList(ApiResponse.completed(value));

      print("api session Details list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("api  session Details list not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }
*/
  Future<void> fetchSessionDetailsListhApi(String? id) async {
    setDataList2(ApiResponse.loading());

    _myRepo.fetchSessionDetailsListApi2(id).then((value) {
      setDataList2(ApiResponse.completed(value));

      print("api session Details list success");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      print("api  session Details list not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }

  Future<void> postMarkAttendanceApi(dynamic data,BuildContext context, {required String id}) async {
    setDataList3(ApiResponse.loading());

    _myRepo.postMarkedAttendanceApi(data).then((value) {
      //setDataList3(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);
      Navigator.of(
          context)
          .pop();
      Get.to(() =>
          ViewDetailClosed(
            id: id,
          ), transition: Transition.rightToLeft);

      print("api postMarkAttendanceApi success");
    }).onError((error, stackTrace) {
     // setDataList3(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
      Navigator.of(
          context)
          .pop();
      print("api  postMarkAttendanceApi not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }

  Future<void> sessionCancelApi(dynamic data, BuildContext context) async {
    setDataList4(ApiResponse.loading());

    _myRepo.putSessionCancelApi(data).then((value) {
      setDataList4(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);
      Navigator.of(context).pop();
      Get.to(()=>  const SessionList(), transition: Transition.rightToLeft);
      print("api sessionCancelApi success");
    }).onError((error, stackTrace) {
      setDataList4(ApiResponse.error(error.toString()));
     Utils.toastMessage(error.toString());
      Navigator.of(context).pop();
      //Navigator.pop(context);
      print("api  sessionCancelApi not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }
  Future<void> sessionEditApi(dynamic data, BuildContext context) async {
    setDataList6(ApiResponse.loading());

    _myRepo.putSessionUpdateApi(data).then((value) {
      setDataList6(ApiResponse.completed(value));
     // Utils.flushBarErrorMessage(value.msg, context);
      Utils.toastMessage(value.msg);
      Get.to(const SessionList());

      //Get.back();i
      print("api sessionEditApi success");
    }).onError((error, stackTrace) {
      setDataList6(ApiResponse.error(error.toString()));
      //Utils.toastMessage(error.toString());
      Utils.toastMessage(error.toString());
      Get.to(const SessionList());


      print("api  sessionEditApi not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }

  Future<void> sessionCloseApi(dynamic data, BuildContext context) async {
    setDataList5(ApiResponse.loading());

    _myRepo.postSessionCloseApi(data).then((value) {
      setDataList5(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);
      print("api sessionCloseApi success");
      Get.to(()=> SessionList(),transition: Transition.rightToLeft);
    }).onError((error, stackTrace) {
      setDataList5(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());

      print("api  sessionCloseApi not success");
      print(error);
      print("error${ApiResponse.error(error.toString())}");
    });
  }
}
