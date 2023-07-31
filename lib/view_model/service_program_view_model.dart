

import 'package:drona/respository/service_program_repository.dart';
import 'package:flutter/cupertino.dart';
import '../model/service_program_model.dart';
import '/data/response/api_response.dart';
class ServiceProgramViewModel with ChangeNotifier {

  final _myRepo = ServiceProgramRepository();

  ApiResponse<ServiceProgramModel> dataList = ApiResponse.loading();

  setDataList(ApiResponse<ServiceProgramModel> response){
    dataList = response ;
    notifyListeners();
  }

  Future<void> fetchServiceProgramListApi (String serviceUid) async {

    setDataList(ApiResponse.loading());
    print("fetchServiceProgramListApi api success");
    _myRepo.fetchServiceProgramListApi(serviceUid).then((value){
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      print("fetchServiceProgramListApi not success");
      print(error.toString());
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
