import 'package:drona/model/invoice_model.dart';
import 'package:drona/respository/billing_repository.dart';
import 'package:flutter/cupertino.dart';
import '../model/batchList_model.dart';
import '../model/batch_Filter_model.dart';
import '/data/response/api_response.dart';
import '/respository/batchList_repository.dart';
class BillingInvoiceViewModel with ChangeNotifier {

  final _myRepo = BillingRepository();

  ApiResponse<InvoiceModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<InvoiceModel> response){
    dataList = response ;
    notifyListeners();
  }


  Future<void> fetchBatchSearchListApi (dynamic data, var pageSize, var pageNo)async{
    setDataList(ApiResponse.loading());
    print("fetchBatchSearchListApi api success");
    _myRepo.fetchBillingInvoiceApi(data,pageSize,pageNo).then((value){
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      print("fetchBatchSearchListApi api not success");
      print(error);
      setDataList(ApiResponse.error(error.toString()));
    });
  }

}
