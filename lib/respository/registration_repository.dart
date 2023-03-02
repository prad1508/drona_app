
import '/data/network/BaseApiServices.dart';
import '/data/network/NetworkApiService.dart';
import '/model/registration_model.dart';
import '/res/app_url.dart';

class RegistrationRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> fetchRegistrationListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registrationListEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
  //otp verify
   Future<dynamic> fetchOtpListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.otpListEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

}


