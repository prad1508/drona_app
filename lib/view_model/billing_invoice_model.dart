import 'package:drona/model/invoice_model.dart';
import 'package:drona/respository/billing_repository.dart';
import 'package:flutter/cupertino.dart';
import '../model/batchList_model.dart';
import '../model/batch_Filter_model.dart';
import '../model/billing_view_model.dart';
import '/data/response/api_response.dart';
import '/respository/batchList_repository.dart';
class BillingInvoiceViewModel with ChangeNotifier {

  final _myRepo = BillingRepository();
  //

  ApiResponse<InvoiceModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<InvoiceModel> response){
    dataList = response ;
    notifyListeners();
  }
  ApiResponse<InvoiceViewModel> dataList1 = ApiResponse.loading();
  setDataList1(ApiResponse<InvoiceViewModel> response){
    dataList1 = response ;
    notifyListeners();
  }


  Future<void> fetchBillingInvoiceApi (dynamic data, var pageSize, var pageNo)async{
    setDataList(ApiResponse.loading());
    print("fetchBillingInvoiceApi api success");
    _myRepo.fetchBillingInvoiceApi(data,pageSize,pageNo).then((value){
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      print("fetchBillingInvoiceApi api not success");
      print(error);
      setDataList(ApiResponse.error(error.toString()));
    });
  }
  Future<void> fetchBillingViewInvoiceApi (dynamic data, var pageSize, var pageNo)async{
    setDataList1(ApiResponse.loading());
    _myRepo.fetchBillingViewInvoiceApi(data,pageSize,pageNo).then((value){
      print("fetchBillingViewInvoiceApi api success");
      setDataList1(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      print("fetchBillingViewInvoiceApi api not success");
      print(error);
      setDataList1(ApiResponse.error(error.toString()));
    });
  }

}
