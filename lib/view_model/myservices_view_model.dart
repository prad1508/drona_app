import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../model/myservices_model.dart';
import '/data/response/api_response.dart';
import '/respository/myservices_repository.dart';
class MyservicesViewViewModel with ChangeNotifier {
  late List<MultiSelectItem<Object?>>myservice =[];
  List<MultiSelectItem<Object?>> get getMyservice=>myservice;
  updateServicesList(myservicerequest){
     myservice = myservicerequest;
     notifyListeners();
  }
  final _myRepo = MyservicesRepository();

  ApiResponse<MyservicesListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<MyservicesListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchMyservicesListApi ()async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchMyservicesListApi().then((value){
      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}