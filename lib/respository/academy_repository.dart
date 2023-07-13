
import 'dart:developer';

import '../data/network/base_apiservices.dart';
import '../model/Edit_academy_model.dart';
import '../model/academy_model.dart';
import '../data/network/network_apiservice.dart';
import '/res/app_url.dart';

class AcademyRepository {
  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<AcademyListModel> fetchAcademyListApi()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.academyRegistrationTrackEndPint);
      log('value -- $response');
      return response = AcademyListModel.fromJson(response);
      
    }catch(e){
      print(e);
      rethrow ;
    }
  }

  Future<EditAcademyListModel> fetchEditAcademyListApi(dynamic data) async {
    print("data coming here is $data");
    try {
      dynamic response = await _apiServices.getPutApiResponseWithData(AppUrl.academyRegistrationTrackEndPint, data);
      print(response);
      print('test');

// Ensure the response is not null before creating the model
      if (response != null) {
        print(EditAcademyListModel.fromJson(response));
        return EditAcademyListModel.fromJson(response);
      } else {
        throw Exception('Null response received');
      }

    } catch (e) {
      print("error is $e");
      rethrow;
    }
  }


  Future<dynamic> fetchouserProfileimg(data) async {
    try {
      dynamic response = await _apiServices.uploadImageHTTP(AppUrl.uploadLogo, data);
      print("successfull upload");
      return response;
    } catch (e) {
      print("not successfully upload");
      rethrow;
    }
  }




}
