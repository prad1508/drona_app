import 'package:flutter/cupertino.dart';
import '../model/coach_list_model.dart';
import '../model/coachlist_model.dart';
import '/data/response/api_response.dart';
import '/respository/coachlist_repository.dart';

class CoachlistViewViewModel with ChangeNotifier {
  final _myRepo = CoachlistRepository();

  ApiResponse<CoachlistListModel> dataList = ApiResponse.loading();
  ApiResponse<CoachlistModel> dataList1 = ApiResponse.loading();
  setDataList(ApiResponse<CoachlistListModel> response) {
    dataList = response;
    notifyListeners();
  }
  setDataList1(ApiResponse<CoachlistModel> response) {
    dataList1 = response;
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

  Future<void> fetchCoachlistApi() async {
    setDataList1(ApiResponse.loading());

    _myRepo.fetchCoachlistApi().then((value) {
      setDataList1(ApiResponse.completed(value));
      print("coachlist api succeed");
    }).onError((error, stackTrace) {
      setDataList1(ApiResponse.error(error.toString()));
      print("coachlist api  not succeed");
      print("coachlist error$error");
    });
  }
}
