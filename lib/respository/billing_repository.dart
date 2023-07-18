
import 'package:drona/model/invoice_model.dart';

import '../data/network/base_apiservices.dart';
import '../model/batchList_model.dart';
import '../data/network/network_apiservice.dart';
import '../model/batch_Filter_model.dart';
import '/res/app_url.dart';

class BillingRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<InvoiceModel> fetchBillingInvoiceApi(dynamic data, var pageSize, var pageNo)async{
    try{
      dynamic response = await _apiServices.getPutApiResponseWithData(
          "${AppUrl.billingInvoiceMonthly}/$pageSize/$pageNo",data);
      return response = InvoiceModel.fromJson(response);

    }catch(e){
      rethrow ;
    }
  }

}
