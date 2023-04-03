

import 'package:flutter/cupertino.dart';
import '../model/postoffice.dart';
import '/data/response/api_response.dart';
import '/respository/postoffice_repository.dart';
class PostofficeViewViewModel with ChangeNotifier {

  final _myRepo = PostofficeRepository();

  ApiResponse<PostofficeListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<PostofficeListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchPostofficeListApi (dynamic data)async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchPostofficeListApi(data).then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
