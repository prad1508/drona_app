import 'package:flutter/cupertino.dart';
import '../model/academy_model.dart';
import '/data/response/api_response.dart';
import '/respository/academy_repository.dart';
class AcademyViewViewModel with ChangeNotifier {

  final _myRepo = AcademyRepository();

  ApiResponse<AcademyListModel> dataList = ApiResponse.loading();
  setDataList(ApiResponse<AcademyListModel> response){
    dataList = response ;
    notifyListeners();
  }
  Future<void> fetchAcademyListApi ()async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchAcademyListApi().then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> fetchEditAcademy(dynamic data)async{
    setDataList(ApiResponse.loading());

    _myRepo.fetchEditAcademyListApi(data).then((value){

      setDataList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setDataList(ApiResponse.error(error.toString()));
    });
  }
}
