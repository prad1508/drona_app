

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
      print("program list api success");
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      print("program list api not success");
      print(error);
      setDataList(ApiResponse.error(error.toString()));
    });
  }
  Future<void> fetchMyProgramAddListApi (dynamic data)async{
    // setDataList(ApiResponse.loading());
    _myRepo.fetchAddSingleMyProgramListApi(data).then((value){
      print("single program list api success");
      //  setDataList(ApiResponse.completed(value));



    }).onError((error, stackTrace){
      print("single program list api not success");
      print(error);

    });
  }
}
