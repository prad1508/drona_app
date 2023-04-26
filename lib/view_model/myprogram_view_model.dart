

import 'package:flutter/cupertino.dart';
import '../model/myprogram_model.dart';
import '/data/response/api_response.dart';
import '/respository/myprogram_repository.dart';
class MyProgramViewViewModel with ChangeNotifier {

  final _myRepo = MyProgramRepository();

  ApiResponse<MyProgramListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<MyProgramListModel> response){
    dataList = response ;
    notifyListeners();
    
  }
  Future<void> fetchMyProgramListApi (dynamic data)async{
    setDataList(ApiResponse.loading());
     
    _myRepo.fetchMyProgramListApi(data).then((value){
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
