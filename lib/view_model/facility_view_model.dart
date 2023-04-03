

import 'package:drona/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import '../model/facility_model.dart';
import '/data/response/api_response.dart';
import '/respository/facility_repository.dart';
class FacilityViewViewModel with ChangeNotifier {
    int count=0;
    int get getCount=>count;
    incrementCount(){
    count++;
    notifyListeners();
    }
    resetcounter(){
      count = 0;
    notifyListeners();
    }
  final _myRepo = FacilityRepository();
  
  ApiResponse<FacilityListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<FacilityListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchFacilityListApi (Data)async{
    setDataList(ApiResponse.loading());
    _myRepo.fetchFacilityListApi(Data).then((value){
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
