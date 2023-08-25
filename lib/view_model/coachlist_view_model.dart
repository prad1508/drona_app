import 'package:drona/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/active_deactive_model.dart';
import '../model/coach_list_model.dart';
import '../model/coachlist_model.dart';
import '../view/academy/service_program.dart';
import '../view/coach_listing/coach_listselected.dart';
import '/data/response/api_response.dart';
import '/respository/coachlist_repository.dart';

class CoachlistViewViewModel with ChangeNotifier {
  final _myRepo = CoachlistRepository();
  bool _loading = false;
  bool get loading => _loading;



  setLoading(bool value) {
    _loading = value;
    notifyListeners();

  }

  ApiResponse<CoachlistListModel> dataList = ApiResponse.loading();
  ApiResponse<CoachlistModel> dataList1 = ApiResponse.loading();
  ApiResponse<ActiveDeactiveModel> dataList2 = ApiResponse.loading();
  setDataList(ApiResponse<CoachlistListModel> response) {
    dataList = response;
    notifyListeners();
  }
  setDataList1(ApiResponse<CoachlistModel> response) {
    dataList1 = response;
    notifyListeners();
  }
  setDataList2(ApiResponse<ActiveDeactiveModel> response) {
    dataList2 = response;
    notifyListeners();
  }

  Future<void> fetchCoachlistListApi() async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchCoachlistListApi().then((value) {
      setDataList(ApiResponse.completed(value));
      print("coachlist api succeed");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("coach add  api  not succeed");
      print("coachlist error$error");
    });
  }

  Future<void> fetchCoachlistApi(Map<String, dynamic> data) async {
    setDataList1(ApiResponse.loading());

    _myRepo.fetchCoachlistApi(data).then((value) {
      print(value);
      setDataList1(ApiResponse.completed(value));
      print("coachlist api succeed");
    }).onError((error, stackTrace) {
      setDataList1(ApiResponse.error(error.toString()));
      print("coachlist api  not succeed");
      print("coachlist error$error");
    });
  }

  Future<void> activateCoachListApi(Map<String, dynamic> data, BuildContext context) async {
    setDataList2(ApiResponse.loading());
    _myRepo.activateCoachListApi(data).then((value) {
      print(value);
      setDataList2(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);

      Navigator.of(context).pop();
      Get.to(() =>CoachListSelected(), transition: Transition.rightToLeft);
      print("activateCoachListApi api succeed");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());

      print("activateCoachListApi api  not succeed");
      print("activateCoachListApi error$error");
    });
  }
  Future<void> deActivateCoachListApi(Map<String, dynamic> data, BuildContext context) async {
    setDataList2(ApiResponse.loading());
    _myRepo.deActivateCoachListApi(data).then((value) {
      print(value);
      setDataList2(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);
      Navigator.of(context).pop();
      Get.to(() =>CoachListSelected(), transition: Transition.rightToLeft);
      print("deActivateCoachListApi api succeed");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());

      print("deActivateCoachListApi api  not succeed");
      print("deActivateCoachListApi error$error");
    });
  }

  Future<void> addMultiCoachApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.addMultiCoachApi(data).then((value) async {
      setLoading(false);

      Get.to(() =>   ServiceListPage(path: 'multiSelectCoach'),transition: Transition.rightToLeft);

      Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      setLoading(false);
      print("error.toString()");
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }




}
