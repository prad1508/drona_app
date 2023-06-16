

import 'package:flutter/cupertino.dart';
import '/data/response/api_response.dart';
import '/model/service_model.dart';
import '/respository/service_repository.dart';
class ServiceViewViewModel with ChangeNotifier {

  final _myRepo = ServiceRepository();

  ApiResponse<ServiceListModel> dataList = ApiResponse.loading();

  setDataList(ApiResponse<ServiceListModel> response){
    dataList = response ;
    notifyListeners();
  }

  Future<void> fetchServiceListApi (data)async{

    setDataList(ApiResponse.loading());
    print("service list api success");
    _myRepo.fetchServiceListApi(data).then((value){
      setDataList(ApiResponse.completed(value));
  
    }).onError((error, stackTrace){
      print("service list api not success");
      print(error.toString());
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
