
import 'package:drona/model/bankdetails_model.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class BankDetailsRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  //userprofile add
  Future<dynamic>  fetchBankDetailsApi(data) async {
    try {
      dynamic response =
      await _apiServices.getPutApiResponseWithData(AppUrl.bankDetails, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }



}
