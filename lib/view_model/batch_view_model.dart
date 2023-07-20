import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';
import '../view/trainne_addmanual.dart';
import '/data/response/api_response.dart';
import '/respository/batch_repository.dart';
import 'batchList_view_model.dart';

class BatchViewViewModel with ChangeNotifier {
  final _myRepo = BatchRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();

  // create batch
  Future<void> fetchCreatebatchListApi(dynamic data, BuildContext context, String batchName, String pathPage , String Fees) async {
    setLoading(true);
    print("path page is $pathPage");
    _myRepo.fetchCreatebatchListApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      print(value);
      print("api of batch create successfull");
      batchListViewViewModel.fetchBatchListListApi();
      /// go to add trainee page
      pathPage=="onboarding" ?
       Get.to(()=>  TrainAddManualy(batchId: value['batch_uid'],
         batchName: batchName,fees: Fees,),transition: Transition.rightToLeft) :
      Get.to(()=>  SearchBatchList(pathPage: 'dashBoard',),transition: Transition.rightToLeft);
    }).onError((error, stackTrace) {
      print("api of batch create not successfull");
      print(error);
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  // edit batch
  Future<void> fetchEditebatchListApi(
      dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.fetchEditbatchListApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      print("edit batch api success");
      batchListViewViewModel.fetchBatchListListApi();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SearchBatchList(
            pathPage: 'onBoarding',
          ),
        ),
      );
    }).onError((error, stackTrace) {
      print("edit batch api not sucsees ");
      print(error);
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}


