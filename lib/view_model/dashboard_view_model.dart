import 'package:flutter/cupertino.dart';
import '../model/dashboard.dart';
import '../respository/dashboard_repository.dart';
import '/data/response/api_response.dart';

class DashboardViewModel with ChangeNotifier {

  final _myRepo = DashboardRepository();

  ApiResponse<DashboardListModel> DataList = ApiResponse.loading();

  setDataList(ApiResponse<DashboardListModel> response){
    DataList = response;
    notifyListeners();
  }

  Future<void> fetchDashboardListApi()async{

    setDataList(ApiResponse.loading());

    _myRepo.fetchDashboardList().then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setDataList(ApiResponse.error(error.toString()));

    });
  }

 

}