import 'package:drona/respository/bankDetails_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/response/api_response.dart';
import '../model/bankdetails_model.dart';
import '../utils/utils.dart';
import '../view/batch_listing/batchlist_search.dart';
import '../view/trainne_addmanual.dart';

class BankDetailsViewModel with ChangeNotifier {
  ApiResponse<BankDetailsModel> dataList = ApiResponse.loading();
  final _myRepo = BankDetailsRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setDataList(ApiResponse<BankDetailsModel> response) {
    dataList = response;
    notifyListeners();
  }

  // create batch
  Future<void> fetchBankDetailsApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.fetchBankDetailsApi(data).then((value) {
      setLoading(false);
      // Utils.flushBarErrorMessage(value['msg'], context);
      Utils.toastMessage(value['msg']);
      print(value);
      print("api of batch create successfull");
      Get.back(result: "success");

      // batchListViewViewModel.fetchBatchListListApi();
      /// go to add trainee page
    }).onError((error, stackTrace) {
      print("api of batch create not successfull");
      print(error);
      setLoading(false);
      Utils.toastMessage(error.toString());

      // Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
