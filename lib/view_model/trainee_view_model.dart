import 'package:drona/model/ledger_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../data/response/api_response.dart';
import '../model/active_deactive_model.dart';
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
  ApiResponse<TraineeListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<TraineeListModel> response) {
    dataList = response;
    notifyListeners();
  }
  ApiResponse<LedgerModel> dataList1 = ApiResponse.loading();
  setDataList1(ApiResponse<LedgerModel> response) {
    dataList1 = response;
    notifyListeners();
  }

  ApiResponse<ActiveDeactiveModel> dataList2 = ApiResponse.loading();
  setDataList2(ApiResponse<ActiveDeactiveModel> response) {
    dataList2 = response;
    notifyListeners();
  }


  /// create Trainee api
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


  ///  Trainee list api
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

  ///  Trainee Activate api
  Future<void> TraineeActivateApi(dynamic data) async {
    setDataList2(ApiResponse.loading());

    _myRepo.TraineeActivateApi(data).then((value) {

      setDataList2(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);

      //Utils.flushBarErrorMessage(value.msg, context);

      print("TraineeActivateApi success");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());

      print("TraineeActivateApi not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }
  ///  Trainee DeActivate api
  Future<void> TraineeDeActivateApi(dynamic data) async {
    setDataList2(ApiResponse.loading());

    _myRepo.TraineeDeActivateApi(data).then((value) {
      setDataList2(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);

      //Utils.flushBarErrorMessage(value.msg, context);
      print("TraineeDeActivateApi success");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());

      print("TraineeDeActivateApi not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }
  /// traineeBatchEditApi api
  Future<void> traineeBatchEditApi(dynamic data, BuildContext context) async {
    setDataList2(ApiResponse.loading());

    _myRepo.traineeBatchEditApi(data).then((value) {
      setDataList2(ApiResponse.completed(value));
      Utils.toastMessage(value.msg);
      Navigator.of(context).pop();
      Get.to(() => const Layout(selectedIndex: 3), transition: Transition.rightToLeft);

      //Utils.flushBarErrorMessage(value.msg, context);
      print("traineeBatchEditApi success");
    }).onError((error, stackTrace) {
      setDataList2(ApiResponse.error(error.toString()));
      Utils.toastMessage(error.toString());
      print("traineeBatchEditApi not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }




  ///  ledger list api
  Future<void> fetchLedgerListSearchApi(dynamic data, var pageCount, var pageNo) async {
    setDataList1(ApiResponse.loading());

    _myRepo.fetchLedgerListSearchApi(data, pageCount, pageNo).then((value) {
      setDataList1(ApiResponse.completed(value));

      print("api fetchLedgerListSearchApi success");
    }).onError((error, stackTrace) {
      setDataList1(ApiResponse.error(error.toString()));
      print("api  fetchLedgerListSearchApi not success");
      print("error${ApiResponse.error(error.toString())}");
    });
  }



  /// record a payment api
  Future<void> recordPaymentApiPost(dynamic data) async {
    setLoading(true);
    _myRepo.recordPaymentApi(data).then((value) async {
      setLoading(false);
      print("recordPaymentApiPost success");
       Utils.toastMessage('Payment record Successfully');
      //Navigator.pushNamed(context, RoutesName.chooseprogram);
    }).onError((error, stackTrace) {

      setLoading(false);
      Utils.toastMessage('$error');

      print("recordPaymentApiPost not success");


      //Utils.flushBarErrorMessage(error.toString(), context);
    });
  }







}

