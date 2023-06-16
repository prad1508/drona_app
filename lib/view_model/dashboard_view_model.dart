import 'package:drona/model/dashboard_model.dart';
import 'package:flutter/cupertino.dart';
import '../respository/homescreen_repository.dart';
import '/data/response/api_response.dart';

class DashBoardViewViewModel with ChangeNotifier {
  final _myRepo = DashBoardRepository();

  ApiResponse<DashBoardModel> dataList = ApiResponse.loading();

  setDataList(ApiResponse<DashBoardModel> response) {
    dataList = response;
    notifyListeners();
  }

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
}
