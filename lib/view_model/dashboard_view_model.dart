import 'package:drona/model/dashboard_model.dart';
import 'package:flutter/cupertino.dart';
import '../model/dashboard_session_model.dart';
import '../respository/homescreen_repository.dart';
import '/data/response/api_response.dart';

class DashBoardViewViewModel with ChangeNotifier {
  final _myRepo = DashBoardRepository();

  ApiResponse<DashBoardModel> dataList = ApiResponse.loading();
  ApiResponse<DashBoardSessionModel> dataList2 = ApiResponse.loading();

  setDataList(ApiResponse<DashBoardModel> response) {
    dataList = response;
    notifyListeners();
  }
  setDataList2(ApiResponse<DashBoardSessionModel> response) {
    dataList2 = response;
    notifyListeners();
  }
  //

  Future<void> fetchDashBoardListApi() async {
    setDataList(ApiResponse.loading());
    print("dashboard list api success");
    _myRepo.fetchHomeListApi().then((value) {
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      print("dashboard list api not success");
      print(error.toString());
      setDataList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchSessionBatchListApi() async {
    setDataList2(ApiResponse.loading());
    print("fetchSessionBatchListApi list api success");
    _myRepo.fetchSessionBatchListApi().then((value) {
      setDataList2(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      print("fetchSessionBatchListApi list api not success");
      print(error.toString());
      setDataList2(ApiResponse.error(error.toString()));
    });
  }



}
