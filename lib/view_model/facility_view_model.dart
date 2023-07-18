

import 'package:drona/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import '../model/facility_model.dart';
import '../model/myFacility_model.dart';
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
  ApiResponse<MyFacilityListModel> dataList1 = ApiResponse.loading();
  setDataList(ApiResponse<FacilityListModel> response){
    dataList = response ;
    notifyListeners();
  }
    setDataList1(ApiResponse<MyFacilityListModel> response){
      dataList1 = response ;
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

  Future<void> fetchGetFacilityListApi (String serviceId)async{
    setDataList1(ApiResponse.loading());
    _myRepo.fetchGetFacilityListApi(serviceId).then((value){
      setDataList1(ApiResponse.completed(value));
      print("success");
    }).onError((error, stackTrace){
      print("not success");
      print(error);
      setDataList1(ApiResponse.error(error.toString()));
    });
  }
}
