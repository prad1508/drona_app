import 'dart:developer';

import 'package:drona/model/service_program_model.dart';

import '../data/network/base_apiservices.dart';
import '../data/network/network_apiservice.dart';
import '../res/app_url.dart';

class ServiceProgramRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<ServiceProgramModel> fetchServiceProgramListApi(String serviceUid)async{

    try{
      dynamic response = await _apiServices.getGetApiResponse("${AppUrl.serviceProgramListEndPoint}$serviceUid");
      log("response==$response");

      return response = ServiceProgramModel.fromJson(response);


    }catch(e){
      rethrow ;
    }
  }





}