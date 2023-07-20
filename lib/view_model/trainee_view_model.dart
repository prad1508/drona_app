import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../data/response/api_response.dart';
import '../model/coachlist_model.dart';
import '../model/trainee_list_model.dart';
import '../respository/batch_repository.dart';
import '../respository/trainee_repositry.dart';
import '../utils/utils.dart';
import '../view/trainee_listing/add_trainee_list.dart';
import '../view/dashboard/layout.dart';
import '../view/trainee_listing/trainee_list.dart';

class TraineeViewModel with ChangeNotifier {
  final _myRepo = TraineeRepository();
 // MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // create Trainee
  Future<void> fetchTraineeAddListApi(
      dynamic data, BuildContext context ,String type) async {
    setLoading(true);
    _myRepo.fetchCreateTraineeListApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      // print("api success");
      type =="onboarding" ?
      Get.to(()=> const  Layout(selectedIndex: 0),transition: Transition.rightToLeft) :
      Get.to(()=> const  TraineeNewList(),transition: Transition.rightToLeft);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (BuildContext context) => const TraineeNewList()
      //       // AddTraineeList(),
      //       ),
      // );
    }).onError((error, stackTrace) {
      setLoading(false);
      print("api  not success");
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (BuildContext context) => const TraineeNewList()),
      // );

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

  /// record a payment api
  Future<void> recordPaymentApiPost(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.recordPaymentApi(data).then((value) async {
      setLoading(false);
      print("recordPaymentApiPost success");
     // Utils.flushBarErrorMessage('recordPaymentApiPost Successfully', context);
      //Navigator.pushNamed(context, RoutesName.chooseprogram);
    }).onError((error, stackTrace) {

      setLoading(false);
      print("recordPaymentApiPost not success");


      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



}
