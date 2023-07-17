import 'package:flutter/cupertino.dart';
import '../model/batchList_model.dart';
import '../model/batch_Filter_model.dart';
import '/data/response/api_response.dart';
import '/respository/batchList_repository.dart';
class BatchListViewViewModel with ChangeNotifier {

  final _myRepo = BatchListRepository();

  ApiResponse<BatchListListModel> dataList = ApiResponse.loading();
  ApiResponse<BatchFilterModel> dataList2 = ApiResponse.loading();
 // ApiResponse<BatchListListModel> get storedataList => dataList;
  setDataList(ApiResponse<BatchListListModel> response){
    dataList = response ;
    notifyListeners();
  }
  setDataList2(ApiResponse<BatchFilterModel> response){
    dataList2 = response ;
    notifyListeners();
  }
  Future<void> fetchBatchListListApi ()async{
    setDataList(ApiResponse.loading());
     print("fetching list api success");
    _myRepo.fetchBatchListListApi().then((value){
      setDataList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      print("fetching list api not success");
      print(error);
      setDataList(ApiResponse.error(error.toString()));
    });
  }


  Future<void> fetchBatchSearchListApi (dynamic data, var pageSize, var pageNo)async{
    setDataList2(ApiResponse.loading());
    print("fetching batch search list api success");
    _myRepo.fetchBatchSearch(data,pageSize,pageNo).then((value){
      setDataList2(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      print("fetching batch search list api not success");
      print(error);
      setDataList2(ApiResponse.error(error.toString()));
    });
  }

}
