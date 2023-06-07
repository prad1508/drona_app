import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../model/coachlist_model.dart';
import '../model/trainee_list_model.dart';
import '../respository/batch_repository.dart';
import '../respository/trainee_repositry.dart';
import '../utils/utils.dart';
import '../view/batch_listing/add_trainee_list.dart';
import '../view/trainee_listing/trainee_list.dart';

class TraineeViewModel with ChangeNotifier {
  final _myRepo = TraineeRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // create Trainee
  Future<void> fetchTraineeAddListApi(
      dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.fetchCreateTraineeListApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);

      print("api success");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const TraineeNewList()
            // AddTraineeList(),
            ),
      );
    }).onError((error, stackTrace) {
      setLoading(false);
      print("api  not success");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const TraineeNewList()),
      );

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  ApiResponse<TraineeListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<TraineeListModel> response) {
    dataList = response;
    notifyListeners();
  }

  Future<void> fetchTraineelistListApi() async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchTraineelistListApi().then((value) {
      setDataList(ApiResponse.completed(value));

      print("api trainne list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print('error is + ${error}');

      print("api  trainne list not success");
    });
  }

  Future<void> fetchTraineeListSearchApi(dynamic data) async {
    setDataList(ApiResponse.loading());

    _myRepo.fetchTraineeListSearchApi(data).then((value) {
      setDataList(ApiResponse.completed(value));

      print("api trainne serach list success");
    }).onError((error, stackTrace) {
      setDataList(ApiResponse.error(error.toString()));
      print("api  trainne search list not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }
}
