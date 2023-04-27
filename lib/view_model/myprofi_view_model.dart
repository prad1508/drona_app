

import 'package:flutter/cupertino.dart';
import '../model/myprofi_model.dart';
import '/data/response/api_response.dart';
import '/respository/myprofi_repository.dart';
class MyprofiViewViewModel with ChangeNotifier {

  final _myRepo = MyprofiRepository();

  ApiResponse<MyprofiListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<MyprofiListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchMyprofiListApi ()async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchMyprofiListApi().then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
