
import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class UserRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  //user login
  Future<dynamic> loginApi(dynamic data) async {
    try {
      print("login api success ");
      dynamic response =
          await _apiServices.getPostWithoutApiResponse(AppUrl.userloginEndPint, data);
      return response;
    } catch (e) {
      print("login api not successful error");
      print(e);
      rethrow;
    }
  }
  //accademy registration track
  Future<dynamic> academyRegistrationTrack() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.academyRegistrationTrackEndPint);
      print("academy api success");
      /// call api my program check the status and then navigate according to the screen
      // print(response);
      return response;
    } catch (e) {
      print("academy api not success");
      print(e);
      rethrow;
    }
  }
  
  //ouser profile
  Future<dynamic> fetchouserProfileimg(data) async {
    try {

      dynamic response =
          await _apiServices.uploadImageHTTP(AppUrl.ouserProfileimgListEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  
  //user logout
  Future<dynamic> fetchUserListApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.userLogout);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //userprofile add
   Future<dynamic> fetchUserprofileAddListApi(data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.UserprofileAdd, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}





