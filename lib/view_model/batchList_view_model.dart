

import 'package:flutter/cupertino.dart';
import '../model/batchList_model.dart';
import '/data/response/api_response.dart';
import '/respository/batchList_repository.dart';
class BatchListViewViewModel with ChangeNotifier {

  final _myRepo = BatchListRepository();

  ApiResponse<BatchListListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<BatchListListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchBatchListListApi ()async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchBatchListListApi().then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
