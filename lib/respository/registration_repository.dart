
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
      print("data==$response");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //services single post

  Future<dynamic> servicePostSingleApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.singleServiceAddApi, data);
      print("data==$response");
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

  // edit Facility

  Future<dynamic> facilityEditListApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPutApiResponseWithData(AppUrl.facilityeEditEndPoint, data);
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
      print("details owner post api success");
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.detailsOwnerListEndPoint, data);
      return response;
    } catch (e) {
      print("details owner post api not success");
      rethrow;
    }
  }  

    //forget password
  Future<dynamic> forgetPasswordListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostWithoutApiResponse(AppUrl.forgetPasswordListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  } 
   //forget verify
  Future<dynamic> resetotpVerifyListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostWithoutApiResponse(AppUrl.resetotpVerify, data);
      print("reset password otp successfull");
      return response;
    } catch (e) {
      print("reset password otp not successfull $e");
      rethrow;
    }
  } 
   //forget verify
  Future<dynamic> verifynewPasswordListApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifynewPassword, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Change Password
  Future<dynamic> changePasswordListApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.changePassword, data);
      print("Data Change Password$response $data");
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  

}





