import 'package:flutter/cupertino.dart';
import '../model/coachlist_model.dart';
import '/data/response/api_response.dart';
import '/respository/coachlist_repository.dart';

class CoachlistViewViewModel with ChangeNotifier {
  final _myRepo = CoachlistRepository();

  ApiResponse<CoachlistListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<CoachlistListModel> response) {
    dataList = response;
    notifyListeners();
  }

  Future<void> fetchCoachlistListApi() async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchCoachlistListApi().then((value) {
      setDataList(ApiResponse.completed(value));
      print("coachlist api succeed");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));

      print("coachlist api  not succeed");
      print("coachlist error$error");
    });
  }
}
