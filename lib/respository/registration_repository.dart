
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class RegistrationRepository {
  final BaseApiServices _apiServices = NetworkApiService();


  Future<dynamic> fetchRegistrationListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostWithoutApiResponse(AppUrl.registrationListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  //otp verify
   Future<dynamic> fetchOtpListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostWithoutApiResponse(AppUrl.otpListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //basic details
  Future<dynamic> basicDetailsListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.basicDetailsListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

//services post 

 Future<dynamic> servicePostListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.serviceListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //facility post 

 Future<dynamic> facilityePostListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.facilityeAddListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Program post 

 Future<dynamic> programPostListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.programListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //details for owner
  Future<dynamic> detailsOwnerPostListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.detailsOwnerListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }  

}





